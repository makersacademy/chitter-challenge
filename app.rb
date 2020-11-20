require 'sinatra/base'
require './lib/user'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base

  enable :session, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    #@peeps = User.all
    erb :'peeps/index'
  end

  run! if app_file == $0

end
