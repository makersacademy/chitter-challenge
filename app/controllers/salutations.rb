class Chitter < Sinatra::Base

  get '/welcome' do
    @username = session[:username]
    erb :welcome
  end

  get '/goodbye' do
    @username = session[:username]
    erb :goodbye
  end

end
