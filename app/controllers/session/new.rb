class Chitter < Sinatra::Base
  get '/session/new' do
    erb :'session/new'
  end
end
