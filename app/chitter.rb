require 'data_mapper'
require 'sinatra/base'
require './lib/peep'
require './lib/user'
require_relative 'data_mapper_setup'
require_relative 'helpers/users'
require 'rack-flash'


class Chitter < Sinatra::Base
  include Helpers
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    content = params['content']
    hashtag = params['hashtag']
    Peep.create(content: content, hashtag: hashtag)
    redirect to('/')
  end

  get '/users/new' do
    @user = User.new
    erb :users
  end


  post '/users' do
  
    @user = User.new(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])
    
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:notice] = "Sorry your passwords don't match"
    erb :users
    end
  end
end

