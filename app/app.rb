ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

# require 'sinatra/flash'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'index'
  end

  get '/peeps/new' do
    erb :'new'
  end

  post '/peeps' do
    # Peep.create(message: params[:message])
    peep = Peep.new(message: params[:message])
    peep.save
    redirect '/peeps'
  end

run! if app_file == $0
end
