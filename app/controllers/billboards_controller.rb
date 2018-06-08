class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all
  end
end