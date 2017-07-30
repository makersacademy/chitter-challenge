ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/posts'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

class CHITTER < Sinatra::Base

  get '/' do
    redirect '/posts'
  end

  get '/stylesheets/style.css' do
    scss :style
  end

  run! if app_file == $PROGRAM_NAME
end
