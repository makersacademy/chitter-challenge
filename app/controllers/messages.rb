class Chitter < Sinatra::Base

  get '/messages' do
    erb :'messages/index'
  end
  
end
