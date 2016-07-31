class Chitter < Sinatra::Base
  get '/messages' do
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end
end
