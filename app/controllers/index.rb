require 'SecureRandom'

require 'pony'

get '/' do
  @list = Category.all
  erb :index
end

get '/category/:id' do
  @id = params['id']
  @category= Category.find(@id)
  @category_items = @category.posts
  p @category_items
  erb :category
end

post '/post' do
  params[:key] = SecureRandom.hex(3)
  puts "hello"
  p params
  @new_post = Post.create(params)
  Pony.mail({
  :to => "#{@new_post.email}",
  :subject => 'Your post was created',
  :via => :smtp,
  :headers => { 'Content-Type' => 'text/html' },
  :body => erb(:email),
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'binaryskipper',
    :password             => 'S112233n',
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost:9292" 
  }
})
  @post_id = @new_post.id
  redirect to "/post/#{@post_id}"
end

get "/post/:params" do
  @id = params["params"]
  @post = Post.find(@id)
  erb:post
end

get "/post/edit/:params" do
  @key = params["params"]
  @post = Post.where("key = '#{@key}'").first
  # p @post
  erb:edit_post
end

#create new post
get '/create_post' do
  @list = Category.all
  erb :create_post
end


