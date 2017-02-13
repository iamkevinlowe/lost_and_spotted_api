class Pet < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy

  enum hair_length: [:short, :long]
  enum pet_type: [:dog, :cat]
  enum size: [:small, :medium, :large]
end
