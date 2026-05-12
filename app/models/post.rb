class Post < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :explanation, presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
end