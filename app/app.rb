ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/sign_up'
  end

  get '/sign_up' do
    erb:'sign_up'
  end

  get '/index' do
    erb:'index'
  end
end
