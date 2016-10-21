require 'sinatra/base'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/sign-up' do
    erb :sign_up
  end

  run! if app_file == $0
end
