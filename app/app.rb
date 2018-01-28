ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
# require 'rake'
require './app/model/peep'
# require './app/model/user'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'really really secret'

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/submit_peep' do
    peep = Peep.create(body: params[:content])
    peep.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
