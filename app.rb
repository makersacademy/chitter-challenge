require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

end