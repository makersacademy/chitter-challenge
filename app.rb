require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'environment'
require './lib/users'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @users = User.all
    erb :index
  end

  run! if app_file == $0
end