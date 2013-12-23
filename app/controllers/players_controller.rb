class PlayersController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def update
  end

  def new
    @new_player = Player.new
  end

  def destroy
  end

  def index
  end

  def create
  end

  def edit
  end
end
