class UsersController < ApplicationController
  def get_current_user_id
    if current_user.present?
      render json: {id: current_user.id} and return
    end
    head :not_found
  end
end