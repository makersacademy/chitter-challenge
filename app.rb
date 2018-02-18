require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:create)
  end

  post '/peeps' do
    Peep.create(params)
    redirect '/'
  end

  # get '/new' do
  #   erb(:new)
  # end
  #
  # post "/" do
  #   Peep.create(peep: params[:peep], title: params[:title])
  #   redirect("/")
  # end
  #
  # run! if app_file == $0
end
