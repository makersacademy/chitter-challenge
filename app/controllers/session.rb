class Chitter < Sinatra::Base
  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    user = User.authenticate(params[:username_or_email],params[:password])
    if user
      session[:user_id] = [user.id]
      redirect '/peeps'
    else
      flash.now[:login_error] = "Wrong username/email or password!"
      erb :'session/new'
    end
  end

  delete '/session/end' do
    redirect '/' unless session[:user_id]
    flash.keep[:logged_out] = 'Goodbye'
    session[:user_id] = nil
    redirect '/'
  end
end
