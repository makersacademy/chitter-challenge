require 'sinatra/base'

class ChitterApp < Sinatra::Base

  # not_found do
  #   status 404
  #   erb :'404Page'
  # end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :new_user
  end

  run! if app_file == $0
end
