require 'sinatra/base'

 DataMapper.setup(:default, 'postgres://user:password@hostname/database')

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

end
