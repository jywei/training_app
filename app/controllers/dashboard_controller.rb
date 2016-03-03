class DashboardController < ApplicationController
  def index
    @strivers = User.paginate(page: params[:page])
  end
end
