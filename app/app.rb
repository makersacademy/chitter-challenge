ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './app/init.rb'

class Chitter < Sinatra::Base

  get '/chitter-home' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Peep.create(body: params[:peep])
    redirect '/chitter-home'
  end

  run! if app_file == $PROGRAM_NAME
end
