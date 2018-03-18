require 'sinatra'
require 'sinatra/base'
require './lib/link'
require './database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  # get '/' do
  #   @links = Link.all
  #   erb(:index)
  # end
  #
  # get '/add-a-new-link' do
  #   erb (:"links/add_a_new_link")
  # end
  #
  # post '/create-new-link' do
  #   flash.now[:notice] = "incorrect syntax" unless Link.create(url: params['url'])
  #   redirect '/'
  # end

  run! if app_file == $0
end
