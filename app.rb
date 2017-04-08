require 'sinatra/base'
require 'data_mapper' #Add in
require_relative 'models/user'

class Chitter < Sinatra::Base

  get '/' do
    erb(:'/index')
  end

end
