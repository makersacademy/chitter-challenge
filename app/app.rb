ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'data_mapper'
require_relative './models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @timestamp = Time.new.strftime("%d/%m/%y at %I:%M%p")
    Peep.create(message: params[:message], timestamp: @timestamp)
    redirect '/peeps'
  end

  run! if app_file == $0

end
