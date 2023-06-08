class Product < ApplicationRecord
  validates :product_name, length: { minimum: 2, maximum: 20 }, presence: true
  validates :price, numericality: { greater_than: 500, less_than: 50_000 }, presence: true
  validates :description, length: { minimum: 10, maximum: 60 }, presence: true
  belongs_to :user
end
