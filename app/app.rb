ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :session

  get '/newpeep' do
    erb(:newpeep)
  end

end
