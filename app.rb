require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/peep'
require './lib/user'
require './lib/userpeep'
require './lib/database_connection'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  #login page
  get '/' do
    erb(:index)
  end

  # submit form on login page, goes to peeps
  post '/:id/login' do
    redirect('/peeps')
  end
  
  # peeps page
  get '/peeps' do
    erb(:peeps)
  end

  # submit form with NEW peep, updates same page
  post '/:id/postpeep' do
    Peep.create(content: params[:content], user_id: params[:id])
    redirect('/peeps')
  end





  run! if app_file == $0

end
