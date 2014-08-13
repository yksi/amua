class EngineController < ApplicationController

  def search
    @q = User.search(params[:q])
  end

end