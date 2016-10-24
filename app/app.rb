ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitterhub < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(user_name: params[:user_name], user_peep: params[:user_peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
