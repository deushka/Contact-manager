class PagesController < ApplicationController
  def profile
    if logged_in?
      @contacts = @current_user.contacts.all
    else
      redirect_to root_url
    end
  end

  def index

  end
end
