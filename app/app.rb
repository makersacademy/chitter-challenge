require 'sinatra/base'
require_relative 'models/peep'
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
    User.create(full_name: params[:full_name],
                username: params[:username],
                email: params[:email])
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
