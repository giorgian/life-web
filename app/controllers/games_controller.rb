class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if params[:reset]
      @game.reset!
    else
      @game.next_step!
    end
    redirect_to @game
  end

  def index
    @games = current_user.games.order(:created_at).limit(10)
  end

  def create
    # TODO: discard file if too big
    @game = Game.from_string(input_param.read, current_user)
    if @game
      redirect_to @game
    else
      flash[:alert] = I18n.t('games.invalid_file')
    end
  end

  private

  def input_param
    params[:game][:input]
  end
end
