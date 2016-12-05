class Chitter < Sinatra::Base

  get '/session/new' do
    erb :'session/new'
  end

  post '/session' do
    user = User.authenticate(params[:username],
                             params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['Email or password incorrect']
      erb :'session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect '/peeps'
  end

end
