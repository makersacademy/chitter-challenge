require 'sinatra'
require 'data_mapper'
require './app/model/peeps'
require './app/model/user'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

  set :views, Proc.new { File.join(root, "views") }


DataMapper.finalize
DataMapper.auto_upgrade!

class ChitterApp < Sinatra::Base
  get '/' do
    erb :index
  end
end