require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'My secret session'

  get '/' do
    @peeps = Peep.all
    erb :index1
    # need to save instance variables here because they last only one route (vs.session variables)
  end

  post '/sign_in' do # gets info entered by user in index.erb form
    session[:username] = params[:username] # stores info in session variables
    session[:password] = params[:password]
    redirect '/signed_in'
  end

  get '/signed_in' do
    @peeps = Peep.all
    @user = User.create(session[:username], session[:password])
    erb :index2
  end
# there was a redundant get route there

  post '/post_peep' do
    Peep.post_peep(params['text'])
    redirect '/signed_in'
  end

  run! if app_file == $0

end
