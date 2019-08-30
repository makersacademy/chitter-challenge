require 'sinatra/base'
require 'sinatra/flash'
require 'pg'

require_relative 'lib/user'
require_relative 'lib/database_connection_setup'

class ApplicationController < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/users' do

  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users/new' do
    user = User.create(params[:email], params[:password])
    flash[:confirmation] = "#{user.email} is now signed up"
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
