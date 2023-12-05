class Nft < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_one_attached :photo

  validates :name, uniqueness: { scope: :description }
end
