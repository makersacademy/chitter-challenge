require 'sinatra/base'
require './lib/peeps'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions


  get '/viewpeeps' do

  end

  get '/chitter' do
    erb :signin
    # flash[:message] = "Your username was not found, please sign up"

  end

  post '/viewpeeps' do

    p params

    # redirect '/viewpeeps' unless @not_user

  end

  run! if app_file == $PROGRAM_NAME


end
