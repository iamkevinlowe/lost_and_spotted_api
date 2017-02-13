class PetSerializer < ActiveModel::Serializer
  attributes :id, :color, :note

  has_many :comments
  has_many :images
end
