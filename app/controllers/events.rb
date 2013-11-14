# Display a list of the current user's created events and links to create a new event
# or edit an existing event
get '/events' do
  redirect_if_not_logged_in

  @user = User.find(session[:current_user_id])
  @created_events = @user.created_events

  erb :show_events_page
end

# # Display a form to allow the current user to create new events
# get '/events/new' do
#   redirect_if_not_logged_in

#   erb :create_event_page
# end

# Process the form data and create a new event associated with the current user
post '/events/new' do
  redirect_if_not_logged_in

  @current_user = User.find(session[:current_user_id])

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
  redirect_if_not_logged_in

  @event = Event.find(params[:event_id])
  erb :edit_event_page
end

# Process the form data and edit the given event
post '/events/:event_id/edit' do
  redirect_if_not_logged_in

  @event = Event.find(params[:event_id])

  @event.update_attributes(
        :name => params[:event_name],
        :location => params[:location],
        :starts_at => DateTime.parse(params[:start_time]),
        :ends_at => DateTime.parse(params[:end_time])
    )

  redirect to '/events'
end

# Delete a given event
post '/events/:event_id/delete' do
  @event = Event.find(params[:event_id])
  @event.delete

  redirect to '/events'
end