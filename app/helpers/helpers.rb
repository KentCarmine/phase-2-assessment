helpers do
  def redirect_if_not_logged_in
    redirect to '/' unless session[:current_user_id]
  end

  def redirect_if_not_resource_owner(owner_id)
    redirect to '/events' unless session[:current_user_id] == owner_id
  end
end