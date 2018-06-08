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
    direction = params[:direction]

    if direction.blank?
      render json: {message: 'Missing vote'}, status: :bad_request and return
    end

    final_message = ''
    begin
      if direction == 'up'
        @board.liked_by(@user)
        final_message = "You have up voted '#{@board.name}'!"
      elsif direction == 'down'
        @board.disliked_by(@user)
        final_message = "You have down voted '#{@board.name}'!"
      end
    rescue => e
      # if there is any wrong with the vote saving
      render json: {message: 'Oops. There is something wrong while saving the vote. Our team has notified.'}, status: :unprocessable_entity and return
    end

    render json: {message: "Thank you. #{final_message}"}
  end

  private

  def get_user
    @user = User.find_by(id: params[:user_id])
  end

  def get_billboard
    @board = Billboard.find_by(id: params[:id])
  end

end