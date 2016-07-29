ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
    #index.erb = enter chitter button
  end

  get '/user/index' do
    erb :'user/index'
    #user/index.erb = sign me up or sign in

  end

  post '/user/new'do
    erb :'user/new'
    #user/new is a form to sign up
  end

  get '/peeps/index' do
    erb :'peeps/index'
    #peeps/index is the links homepage
  end

run! if app_file == $0
end
