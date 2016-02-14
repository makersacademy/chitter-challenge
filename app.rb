ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable(:sessions)
  set :session_secret, 'super secret'

  get '/' do
    @name = session[:name]
    @user_id = session[:user_id]
    erb(:index)
  end


  post '/names' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:name] = user.name
    session[:user_id] = user.id
    redirect("/peep")
  end

  post '/new' do
    p params
    peep = Peep.create(text: params[:text])
    @peeps = Peep.all
    redirect(:peep)
  end

  get '/peep' do
    erb(:peep)
  end

  helpers do
    def current_user
      @current_user || User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end