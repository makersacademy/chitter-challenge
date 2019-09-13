require 'sinatra/base'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/login' do
    redirect('/peeps')
  end
  
  get '/peeps' do
    erb(:peeps)
  end





  run! if app_file == $0

end
