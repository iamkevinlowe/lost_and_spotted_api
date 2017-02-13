class CommentsController < ApplicationController
  def create
    pet = Pet.find params[:pet_id]
    comment = pet.comments.build comment_params

    status = comment.save ? 200 : 401

    render json: comment, status: 200
  end

  def destroy
    # TODO: Consider finding pet with params[:pet_id] first?
    comment = Comment.find params[:id]

    status = comment.destroy ? 200 : 401

    render json: comment, status: status
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
