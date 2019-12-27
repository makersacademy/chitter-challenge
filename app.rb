require 'bcrypt'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
# require_relative 'lib/user'
# require_relative 'lib/space'
# require_relative 'lib/request'
# require_relative 'lib/date_helper'
require 'json'


class ChitterApp < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    session[:user] = params[:'first-name']
    p session[:user]
    redirect '/peeps'
  end

  get '/peeps' do
    @first_name = session[:user]
    erb :'peeps/index'
  end

end