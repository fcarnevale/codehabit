class CheckinsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @checkin = current_user.checkins.build(params[:checkin])
    if @checkin.save
      flash[:success] = "checkin created!"
      redirect_to root_url
    else
      # @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @checkin.destroy
    redirect_to root_url  
  end

  private

    def correct_user
      @checkin = current_user.checkins.find_by_id(params[:id])
      redirect_to root_url if @checkin.nil?
    end

end