require 'data_mapper'
require 'sinatra/base'
require_relative './models/peep.rb'
require_relative './models/user.rb'
ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'You arrived at the homepage'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:new)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
  user = User.create(email: params[:email],
                    password_digest: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  post '/peeps' do
    peep = Peep.new(title: params[:title], text: params[:text])
    peep.save
    redirect to('/peeps')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
