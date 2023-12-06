class Nft < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_one_attached :photo

  validates :name, uniqueness: { scope: :description }
  validates :price, numericality: { greater_than_or_equal_to: 1 }
end
