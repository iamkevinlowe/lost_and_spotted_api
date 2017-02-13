class Api::PetsController < ApplicationController
  def index
    # TODO: Paginate
    pets = Pet.all

    render json: pets, status: 200
  end

  def show
    if pet = Pet.find_by_id(params[:id])
      status = 200
    else
      pet = { errors: [I18t('api.failures.not_found', klass: 'Pet')] }
      status = 401
    end

    render json: pet, status: status
  end

  def create
    pet = Pet.new(pet_params)

    if pet.save
      status = 200
    else
      pet = { errors: pet.errors }
      status = 401
    end

    render json: pet, status: status
  end

  def update
    if pet = Pet.find_by_id(params[:id])
      if pet.update_attributes(pet_params)
        status = 200
      else
        pet = { errors: pet.errors }
        status = 401
      end
    else
      pet = { errors: [I18t('api.failures.not_found', klass: 'Pet')] }
    end

    render json: pet, status: status
  end

  private

  def pet_params
    params.require(:pet).permit(
      :color,
      :found,
      :hair_length,
      :licensed,
      :note,
      :pet_type,
      :size
    )
  end
end
