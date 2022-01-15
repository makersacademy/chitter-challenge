require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
    also_reload 'app.rb'
  end 

  run! if app_file == $0
end

