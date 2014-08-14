class TestController < ApplicationController
  def hth
    @text = 'misha'.titleize
  end

  def get_last_user_fullname
    respond_to do |format|
      format.js { render text: User.last.fullname }
      # format.html redirect_to: root_path
    end
  end
end