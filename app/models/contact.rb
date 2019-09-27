class Contact < ApplicationRecord
  belongs_to :user

  validates :email, :address, :phone, presence: true
end
