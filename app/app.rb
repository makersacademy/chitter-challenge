require 'sinatra/base'
require_relative 'data_mapper_setup'

class App < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                    name: params[:name],
                    nickname: params[:nickname],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    # user.save
  end
end
