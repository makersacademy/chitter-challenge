ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/peep.rb'
require_relative './models/user.rb'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peep/new'
  end

  get '/peep/new' do
    erb :new_peep
  end

  post '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  # get '/user/new' do
  #     erb :new_user
  # end
end
