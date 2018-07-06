class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if (user && user.authenticate(params[:session][:password]))
      # GO TO ADMINPAGE
      log_in user
      redirect_to contacts_path
    else
      flash.now[:danger] = "Invalid login or password"
      render 'new'
    end
  end


def destroy
  log_out
  redirect_to root_url
end

end
