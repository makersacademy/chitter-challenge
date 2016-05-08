class Chitter < Sinatra::Base

  get '/users/new' do
    @email = session[:email]
    erb :'/users/new'
  end

  get '/users/login' do
    @email = session[:email]
    erb :'/users/login'
  end

  post '/users' do
    @user = create_user
    session[:user_id] = @user.id
    redirect '/' if @user.save
    session[:email] = params[:email]
    flash.keep[:errors] = @user.errors.full_messages
    redirect '/users/new'
  end

end
