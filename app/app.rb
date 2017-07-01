ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep.rb'

class Chitter < Sinatra::Base

require_relative 'data_mapper_setup'

  get '/peeps' do
    @peeps = Peep.all.reverse 
    erb :peeps
  end

  get '/peeps/new' do
    erb :peeps_new
  end

  post '/peeps' do
    Peep.create(name: params[:name], message: params[:message])
    redirect '/peeps'
  end


  run! if app_file == $0
end
