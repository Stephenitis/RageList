require 'SecureRandom'
#this will be our list homepage
get '/' do
  @list = Category.all
  erb :index
end

#this will be our specific cat list
get '/category/:id' do
  @id = params['id']
  @category= Category.find(@id)
  @category_items = @category.posts
  p @category_items
  erb :category
end

post '/post' do
  params[:key] = SecureRandom.hex(3)
  @new_post = Post.create(params)
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

