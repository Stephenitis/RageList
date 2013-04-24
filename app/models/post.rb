class Post < ActiveRecord::Base
  belongs_to :category
  validates :name, :description, :price, :category_id, :presence => true
end
