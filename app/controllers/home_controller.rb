class HomeController < ApplicationController
  def show
    @games_count = current_user.games.size if current_user
  end
end
