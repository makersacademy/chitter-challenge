require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions, :method_override # allows us to use patch, delete etc

  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end
