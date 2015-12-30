class Chitter < Sinatra::Base
  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end
end
