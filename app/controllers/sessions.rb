class Chitter < Sinatra::Base

  get '/sessions/new' do
    @user = User.new
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:error] = 'Email or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Come back soon'
    redirect to '/peeps'
  end

end
