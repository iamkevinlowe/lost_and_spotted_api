class Api::PetsController < ApplicationController
  def index
    pets = Pet.all

    render json: pets, status: 200
  end

  def show
    pet = Pet.where(id: params[:id]).first

    status = pet ? 200 : 401

    render json: pet, status: status
  end

  def create
    pet = Pet.new Pet_params

    status = Pet.save ? 200 : 401

    render json: pet, status: status
  end

  def update
    pet = Pet.find params[:id]

    status = pet.update_attributes(pet_params) ? 200 : 401

    render json: pet, status: status
  end

  private

  def pet_params
    params.require(:pet).permit(:color, :found, :hair_length, :licensed, :note, :pet_type, :size)
  end
end
