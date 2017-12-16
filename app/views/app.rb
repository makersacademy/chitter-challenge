ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'sinatra/base'
require './app/models/tweet'
require_relative 'data_mapper_setup'

class Twitter < Sinatra::Base

get '/tweets' do
  erb(:tweets)
end

end
