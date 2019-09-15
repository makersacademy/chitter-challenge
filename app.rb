require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://user:rafaela@127.0.0.1/chitter')

class Chitter < Sinatra::Application

  get '/' do
    erb :index
  end

end
