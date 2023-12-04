class Nft < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :name, uniqueness: { scope: :description }
end
