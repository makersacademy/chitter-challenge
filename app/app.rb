ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/datamapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new' do
    username = params[:username]
    peep_msg = params[:peep]
    timestamp = Time.new.strftime("%H:%M:%S %a-%d-%b-%Y")
    Peep.create(message: peep_msg, username: username, time: timestamp)
    redirect '/peeps'
  end

  run if app_file == $0
end
