class CheckinsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
    @checkins = current_user.checkins if signed_in?
  end

  def show
        
  end

  def create
    @add_to_streak = current_user.process_streak
    @checkin = current_user.checkins.build(params[:checkin])
    if @checkin.save
      respond_to do |format|
        format.html { 
          flash[:success] = "checkin created!"
          redirect_to root_url 
        }
        format.js
      end
    end
    # if @checkin.save
    #   flash[:success] = "checkin created!"
    #   redirect_to root_url
    # else
    #   # @feed_items = []
    #   render 'pages/home'
    # end
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

    def streak
      @add_to_streak = current_user.process_streak
      @add_to_streak = false
      puts "ADD TO STREAK VAR: #{@add_to_streak.inspect}"
    end

end