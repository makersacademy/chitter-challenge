require 'sinatra'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :'main'
  end
end