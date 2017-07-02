ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    @tweets = Tweet.all
    erb :homepage
  end

  post '/' do
    Tweet.create(message: params[:message])
    @tweets = Tweet.all.reverse
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end
end
