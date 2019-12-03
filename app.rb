require 'sinatra/base'
require 'pg'
#require 'simplecov'
require_relative './lib/peep.rb'
class Chitter < Sinatra::Base
  get '/' do
        "This is a chitter-Challenge!"
  end
 #run! if app_file == $0
 get '/post_message' do
   erb :index
   #"peep"
 end
 end
