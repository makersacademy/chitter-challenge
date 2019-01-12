require 'sinatra/base'
require 'pry'


class ChitterApp < Sinatra::Base
    set :sessions, true

    get '/' do 
        erb :home
    end
  
end  