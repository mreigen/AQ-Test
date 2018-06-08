class BillboardsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :get_user, only: :vote
  before_action :get_billboard, only: :vote

  # FIXME: authenticate user for this POST request
  skip_before_action :verify_authenticity_token, only: :vote

  def index
    @billboards = Billboard.all
  end

  def vote
    @board.liked_by(@user)
  end

  private

  def get_user
    @user = User.find_by(id: params[:user_id])
  end

  def get_billboard
    @board = Billboard.find_by(id: params[:id])
  end

end