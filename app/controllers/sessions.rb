class ChitterApp < Sinatra::Base
  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:signinerror] = 'Invalid username/password'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:sign_out] = 'You have successfully signed out'
    redirect to('/peeps')
  end
end
