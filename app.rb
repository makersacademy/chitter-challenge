require 'sinatra/base'
require_relative './lib/chitter_model'
require_relative './lib/user_model'
require 'sass'

class Chitter < Sinatra::Base
  enable :sessions
  get '/styles.css' do
    scss :styles
  end

  get '/' do
    erb :front_page
  end

  get '/chitter' do
    erb :'chitter/index'
  end

  get '/chitter/new' do

    erb :'chitter/new', :layout => :layout
  end

  get '/chitter/username' do
    @peeps = ChitterModel.all
    erb :'chitter/username'
  end

  post '/chitter/username' do
    ChitterModel.create(params[:peep])
    redirect '/chitter/username'
  end

  post '/user' do
    User.create(fname: params[:username],
      lname: params[:lastname],
      email: params[:email], 
      password: params[:pass])
    redirect '/user/login'
  end

  get '/user/new' do
    erb :'user/new'
  end

  get '/user/login' do
    erb :'user/login'
  end

  not_found do
    erb :'/error/oops', :layout => :special
  end

  run! if __FILE__ == $0
end