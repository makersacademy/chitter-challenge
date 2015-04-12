get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  user = User.new username: params[:username],
                  first_name: params[:first_name],
                  last_name: params[:last_name],
                  email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:confirm_password]

  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    flash[:errors] = [user.errors.full_messages]
    redirect '/users/new'
  end
end