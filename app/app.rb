ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'pry'

class Chitter < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all.sort_by{ |peep| peep.created_at }.reverse
    @user = current_user
    erb :'peeps/index'
  end

  post '/peeps' do
    link = Peep.create(content: params[:content])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
            user_name: params[:user_name],
            email_address: params[:email_address],
            password: params[:password])
    session[:id] = user.id
    redirect '/peeps'
  end

end
