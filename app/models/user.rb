class User < ApplicationRecord
  validates :name, :email, :contact, :avatar ,presence: true
  validates :email, uniqueness: true
  validates :contact, numericality: { only_integer: true }
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end
