class AddEmails < ActiveRecord::Migration
def up
  add_column :posts, :email, :string
end
end
