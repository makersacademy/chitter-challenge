require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'

  get '/' do
    'Hello world'
    erb :home
  end

  get '/signup' do
    erb :new_user
  end

  post '/users/new' do
    @user = User.create(full_name: params[:full_name],
                username: params[:username],
                email: params[:email])
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps_list
  end

  get '/peeps/new' do
    erb :'new_peep'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

end
