module PagesHelper
  def contacts_count?
    logged_in?
    @current_user.contacts.all.count
  end
end
