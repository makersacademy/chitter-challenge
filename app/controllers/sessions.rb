class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:username_or_email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:error_message] = 'Sign in failed. Please try again'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session.clear
    flash.next[:goodbye] = 'You have been signed out'
    @current_user = nil
    redirect '/peeps'
  end
end
