class PetSerializer < ActiveModel::Serializer
  attributes :id, :color, :found, :hair_length, :licensed, :note, :pet_type, :size

  has_many :comments
  has_many :images
end
