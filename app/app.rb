ENV["RACK_ENV"] = "test"

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    @user = User.all
    erb :'/timeline/index'
  end

  post '/' do
    peep = Peep.new(body: params[:peep_body], time: '2017-08-26 10:28:19 +010')
    peep.save
    redirect '/'
  end

  get '/user/new' do
    erb :'/user/new'
  end

  post '/user/new' do
    user = User.new(username: params[:username], password: params[:password])
    user.save
    redirect '/'
  end
end
