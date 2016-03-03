class DashboardController < ApplicationController
  def index
    @strivers = User.all
  end
end
