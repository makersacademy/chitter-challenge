class Chitter < Sinatra::Base

  get '/cheeps/index' do
    erb :'cheeps/index'
  end

end