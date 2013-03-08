module SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    if !signed_in?
      redirect_to signin_url, notice: "please sign in."
    end
  end
end