ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  get '/user/new' do
    erb :'user/new'
  end

  post '/user/index' do
    User.create(email: params[:email], password: params[:password])
    redirect 'peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/index' do
    Peep.create(content: params[:content], created_at: Time.now)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    @user = User.all
    erb :'peeps/index'
  end

end
