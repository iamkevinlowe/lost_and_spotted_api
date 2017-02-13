class Api::CommentsController < ApplicationController
  def create
    if pet = Pet.find_by_id(params[:pet_id])
      comment = pet.comments.build(comment_params)
      if comment.save
        status = 200
      else
        comment = { errors: comment.errors }
        status = 401
      end
    else
      comment = {
        errors: [I18n.t('api.failures.not_found', klass: 'Pet')]
      }
      status = 401
    end

    render json: comment, status: status
  end

  def destroy
    if pet = Pet.find_by_id(params[:pet_id])
      if comment = Comment.find_by_id(params[:id])
        status = comment.destroy ? 200 : 401
      else
        comment = {
          errors: [I18n.t('api.failures.not_found', klass: 'Comment')]
        }
        status = 401
      end
    else
      comment = {
        errors: [I18n.t('api.failures.not_found', klass: 'Pet')]
      }
      status = 401
    end

    render json: comment, status: status
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
