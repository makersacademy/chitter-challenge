# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'

# This is bigboy class
class ChitterController < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    session[:peeps] = []
    @peeps = session[:peeps]
    erb :index
  end

  get '/add_peep' do
    erb :add_peep
  end

  post '/' do
    session[:peeps] << params[:peep]
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = session[:peeps]
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
