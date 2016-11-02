class Chitter < Sinatra::Base
  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] =  ['User email or password is incorrect']
      erb :'session/new'
    end
  end

  delete '/session/end' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Farewell!'
    redirect '/'
  end
end
