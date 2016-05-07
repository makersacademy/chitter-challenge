class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:sessions] = ['The email or password is incorrect']
      # redirect "/"  # why the flash does not work???
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "goodbye!"
    redirect to '/peeps'
  end
end