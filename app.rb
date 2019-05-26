require 'sinatra/base'
require './lib/peep'
require 'sinatra/flash'
require './spec/database_helpers'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  # get '/' do
  #   erb :index
  # end
  #
  # post '/time' do
  #   flash[:time] = Time.now.strftime("%I:%M:%S")
  #   redirect '/'
  # end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :chitter
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $0
end
