# frozen_string_literal: true

require 'sinatra/base'
require './lib/peep.rb'

# this is a chitter app - it lets you post messages to a webpage to
# communicate with others

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:username] = params[:username]
    redirect '/homepage'
  end

  get '/homepage' do
    @username = session[:username]
    @peeps = Peep.all
    erb :homepage
  end

  post '/new' do
    Peep.add(session[:username], params[:peep])
    redirect '/homepage'
  end

  run! if app_file == $PROGRAM_NAME
end
