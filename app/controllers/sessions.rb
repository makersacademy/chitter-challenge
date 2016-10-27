class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/sign_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    p user
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/sign_in'
    end
  end

  delete '/sessions' do
    @peeps = Peep.all
    @users = User.all
    session.clear
    flash.now[:notice] = "Goodbye!"
    erb :index
  end

end
