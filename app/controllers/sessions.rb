class Chitter < Sinatra::Base
 get '/log_in' do
    erb :'session/new'
 end

  post '/session/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/home'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    flash.keep[:notice] = "Farewell"
    redirect '/home'
  end


end
