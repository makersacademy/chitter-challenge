require 'sinatra'
require 'sinatra/reloader'


class Chitter < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

end
