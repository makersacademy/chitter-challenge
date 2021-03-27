require 'sinatra/base'
require './database_setup'
require './lib/user.rb'
require './lib/message.rb'

class Chitter < Sinatra::Base
  enable :method_overide, :sessions

  get '/' do
    erb :index
  end

end
