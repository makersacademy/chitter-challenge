require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'
require 'uri'
require './lib/peep'



class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post 'sign_up' do
    User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], user_password: params[:user_password])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
  redirect '/peeps'
  end

  # Start the server if this file is executed directly 
  # (do not change the line below)
  run! if app_file == $0
end