class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :carts
  validates :name, presence: :true 
  validates :description, presence: :true 
  validates :price, presence: :true 
  validates :brand_id, presence: :true
  validates :category_id, presence: :true
end
