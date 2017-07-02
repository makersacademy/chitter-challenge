ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @tweets = Tweet.all
    erb :homepage
  end

  post'/' do
    tweet = Tweet.create(message: params[:message])
    @tweets = Tweet.all.reverse
    erb :homepage
  end
end
