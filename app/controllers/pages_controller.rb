class PagesController < ApplicationController
  def home
  	if signed_in?
      @checkin = current_user.checkins.build
  	end
  end

  def about
  end
end
