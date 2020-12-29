require 'sinatra/base'
require_relative './lib/user.rb'
require_relative './database_connection.rb'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all.order(created_at: :desc)
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/save_peep' do
    Peep.create(params[:peep])
    redirect '/peeps'
  end

end
