ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'dm_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(message: params[:message])
    redirect to '/peeps'
  end
end
