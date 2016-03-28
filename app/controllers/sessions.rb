class Chitter < Sinatra::Base

  get '/sessions' do
    erb(:'sessions/index')
  end

  post '/sessions/new' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to '/home'
    else
      flash.now[:errors] = 'Incorrect email or password'
      erb(:'sessions/index')
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "You are logged out. See you next time!"
    redirect to '/sessions/end'
  end

  get '/sessions/end' do
    erb(:'sessions/end')
  end
end
