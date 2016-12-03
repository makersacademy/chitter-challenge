ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

end
