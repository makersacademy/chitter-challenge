class Chitter < Sinatra::Base

  delete '/sessions' do
    session[:user_id] = nil
    flash[:messages] = ["Successfully signed out"]
    redirect '/'
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

end
