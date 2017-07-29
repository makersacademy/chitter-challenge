ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:new_peep)
  end

  post '/peeps' do
    p params
    peep = Peep.create(message: params[:message])
    peep.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
