class Item < ApplicationRecord
  validates_presence_of :name, :description, :quantity, :status
  enum status: {"In stock" => 0, "Out of stock" => 1}
  validates :quantity, numericality: {only_integer: true}
  validates :quantity, numericality: {:greater_than_or_equal_to => 0}
end
