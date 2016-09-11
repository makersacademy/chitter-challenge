class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:notice] = 'Email or password incorrect'
      erb :'sessions/new'
    end
  end
end
