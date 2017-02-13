class Api::ImagesController < ApplicationController
  def create
    if pet = Pet.find_by_id(params[:pet_id])
      image = pet.images.build(image_params)
      if image.save
        status = 200
      else
        image = { errors: image.errors }
        status = 401
      end
    else
      image = { errors: [I18t('api.failures.not_found', klass: 'Image')] }
      status = 401
    end

    render json: image, status: status
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
