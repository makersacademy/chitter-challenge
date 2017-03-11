require 'sinatra/base'
require_relative 'models/peep'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'

  get '/' do
    'Hello world'
  end

  get '/peeps' do
    erb :peeps_list
  end

  get '/peeps/new' do
    erb :'new_peep'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

end
