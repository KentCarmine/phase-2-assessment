# Display a list of the current user's created events and links to create a new event
# or edit an existing event
get '/events' do
  @user = User.find(session[:current_user_id])
  @created_events = @user.created_events

  erb :show_events_page
end

# Display a form to allow the current user to create new events
get '/events/new' do

  erb :create_event_page
end

# Process the form data and create a new event associated with the current user
post '/events/new' do
  @current_user = User.find(session[:current_user_id])

  # created_event = Event.create(
  #   :name => params[:event_name],
  #   :location => params[:location],
  #   :starts_at => params[:start_time],
  #   :ends_at => params[:end_time]
  #   )

  @current_user.created_events.create(
        :name => params[:event_name],
        :location => params[:location],
        :starts_at => DateTime.parse(params[:start_time]),
        :ends_at => DateTime.parse(params[:end_time])
    )

  redirect to '/events'
end

# Display a form to allow the current user to edit one of their created events
get '/events/:event_id/edit' do

end

# Process the form data and edit the given event
get '/events/:event_id/edit' do

end