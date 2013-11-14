helpers do
  def redirect_if_not_logged_in
    redirect to '/' unless session[:current_user_id]
  end
end