require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'twitter_clone'

class TwitterClone < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # enable :method_override
  
  run! if app_file == $0
end