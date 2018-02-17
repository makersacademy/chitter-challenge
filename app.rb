ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './lib/comment'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'pg'
require './spec/database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @comments = Comment.all
    erb :index
  end

  post '/new' do
    Comment.create(comment: params[:message])
    redirect '/'
  end

end
