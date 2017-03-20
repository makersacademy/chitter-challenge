class Chitter < Sinatra::Base

  get '/session/new' do
    erb :'./session/new'
  end

  delete '/session' do
    session[:user_id] = nil
    redirect to '/session/new'
  end

end
