ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative './data_mapper_setup'
require_relative './models/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], time_stamp: Peep.time)
    redirect '/peeps'
  end

  run! if app_file == $0
end
