class BillboardsController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @billboards = Billboard.all
  end
end