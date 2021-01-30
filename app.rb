require 'sinatra'
require_relative "lib/peep"
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
  Peep.create(params[:message])
  redirect '/peeps'
  end

  run! if app_file == $0
end
