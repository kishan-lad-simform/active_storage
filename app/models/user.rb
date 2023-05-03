class User < ApplicationRecord
  has_one_attached :avatar, service: :local
  validates :name, :email, :contact, :avatar ,presence: true
  validates :email, uniqueness: true
  validates :contact, numericality: { only_integer: true }
end
