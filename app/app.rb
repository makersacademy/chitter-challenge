ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/registration'
  end

  get '/registration' do

  end
end
