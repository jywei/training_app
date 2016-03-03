class DashboardController < ApplicationController
  def index
    @strivers = User.paginate(page: params[:page])
  end

  def search
    @strivers = User.search_by_name(params[:search_name]).paginate(page: params[:page])
  end
end
