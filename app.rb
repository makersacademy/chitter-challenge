require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  #login page
  get '/' do
    erb(:index)
  end

  # submit form on login page, goes to peeps
  post '/login' do
    redirect('/peeps')
  end
  
  # peeps page
  get '/peeps' do
    erb(:peeps)
  end

  # submit form with NEW peep, updates same page
  post '/postpeep' do
    redirect('/peeps')
  end





  run! if app_file == $0

end
