class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews
  has_one_attached :photo, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  # validates :image_url, presence: true
end
