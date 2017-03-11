require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'
  enable :sessions

  get '/' do
    'Hello world'
    erb :home
  end

  get '/signup' do
    erb :new_user
  end

  post '/users/new' do
    user = User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                username: params[:username],
                email: params[:email])
    session['user_id'] = user.id
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

  helpers do
    def current_user
      @current_user ||= User.get(session['user_id'])
    end
  end

end
