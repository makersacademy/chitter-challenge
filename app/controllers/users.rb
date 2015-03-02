get '/users/new' do
  if session[:user_id]
    redirect to ('/')
  end
   @user = User.new
  erb :"users/new"
end

post '/users' do
  if session[:user_id]
    redirect to ('/')
  end
  @user = User.create(:username => params[:username],
                    :email => params[:email],
                    :password => params[:password],
                    :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash[:errors] = @user.errors.full_messages
    erb :"users/new"
  end
end