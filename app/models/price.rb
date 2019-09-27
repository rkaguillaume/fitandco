class Price < ApplicationRecord
  belongs_to :user

  validates :price, :duration, :description, presence: true
end
