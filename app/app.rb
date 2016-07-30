ENV['RACK_ENV'] = 'development'


require 'sinatra/base'

#require_relative 'controllers/users'


class Chitter < Sinatra::Base

  get '/' do
    erb :'/users/new'
  end

  run! if app_file == $0
end
