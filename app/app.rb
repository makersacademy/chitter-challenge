ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
TIME_FORMAT = '%e-%b-%Y %I:%M:%S %p'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :public_folder, Proc.new { File.join(root, 'static') }

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message],
                    created_at: Time.now)
    peep.save
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
              password: params[:password],
              name: params[:name],
              username: params[:username])
    p user, user.id
    session[:user_id] = user.id
    redirect('/peeps')
  end


  run! if app_file == $0
end
