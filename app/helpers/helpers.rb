helpers do
  def redirect_if_not_logged_in
    redirect to '/' unless params[:current_user_id].nil?
  end
end