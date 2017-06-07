ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

require_relative 'server'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/posts'
require_relative 'controllers/comments'



class Chitter < Sinatra::Base


  get '/' do
    redirect to '/posts'
  end

  run! if app_file == $0
end
