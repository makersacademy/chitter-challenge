class Chitter < Sinatra::Base
  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    
    redirect 'peeps'
  end
end
