require 'sinatra/base'
require './lib/peep'
require_relative './database_connection_setup.rb'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super super secret'

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(time: Time.now, post: params[:post])
    redirect('/peeps')
  end

  run! if app_file == $0

end
