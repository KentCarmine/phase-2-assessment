get '/login'  do
  erb :login_page
end


post '/login' do
  current_user = User.find_by_email(params[:email])

  if current_user
    current_user = current_user.authenticate(params[:password]) # NOT SURE IF THIS SHOULD INVALIDATE CURRENT_USER

    if current_user
      session[:current_user_id] = current_user.id
      puts "HERE"
      redirect to '/'
    else
      puts "FAILED TO LOGIN 1"
      redirect to '/login'
    end

  end
  puts "FAILED TO LOGIN 2"
  redirect to '/login'
end

get '/logout' do
  session.clear
  puts "LOGGED OUT"
  redirect to '/'
end

get '/users/new' do
  erb :create_user_page
end

post '/users/new' do
  user = User.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :birthdate => Date.parse(params[:birthdate]),
    :email => params[:email],
    :password => params[:password]
    )

  session[:current_user_id] = user.id

  redirect to '/'
end