ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  enable :sessions
  # set :public_folder, File.dirname(__FILE__) + '/'

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/sign-up' do
    email = params[:email]
    password = params[:password]
    name = params[:name]
    user_name = params[:user_name]
    Peep.create(email: email, password: password, name: name, user_name: user_name)
    redirect '/peeps', 302
  end

  # get '/home' do
  #   erb :home
  # end
end
