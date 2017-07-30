ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

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
    peep = Peep.create(content: params[:content])
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
            user_name: params[:user_name],
            email_address: params[:email_address],
            password: params[:password],
            password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/peeps'
    else
      flash.now[:notice] = "Passwords do not match"
      erb :'users/new'
    end
  end

end
