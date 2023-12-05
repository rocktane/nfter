class Transaction < ApplicationRecord
  belongs_to :nft
  belongs_to :user
  # validates :begin_date, presence: true
  # validates :end_date, presence: true

end
