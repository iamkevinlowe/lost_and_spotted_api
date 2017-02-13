class ImagesController < ApplicationController
  def create
    pet = Pet.find params[:pet_id]
    image = pet.images.build image_params

    status = image.save ? 200 : 401

    render json: image, status: status
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
