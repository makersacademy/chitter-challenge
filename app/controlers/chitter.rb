class Chitter < Sinatra::Base

  get '/chitter' do
    erb :'chitter/index'
  end

end
