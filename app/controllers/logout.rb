class Chitter < Sinatra::Base

  get '/logout' do
    erb :logout
  end
  
end
