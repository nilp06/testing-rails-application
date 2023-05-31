class Product < ApplicationRecord
  validates :product_name, length: { minimum: 3, maximum: 20 }, presence: true
  validates :price, inclusion: { in: [300..1000] }, presence: true
  validates :description, length: { minimum: 20, maximum: 60 }, presence: true
  belongs_to :user
end
