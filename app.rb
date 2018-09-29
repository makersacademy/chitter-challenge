require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    erb :index
  end

  post '/peeps' do
    redirect('/peeps')
  end
  
  get '/peeps/new' do
    erb :create_peep
  end


  run! if app_file == $0
end
