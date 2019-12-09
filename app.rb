require_relative './lib/peep'
require 'pg'
require 'sinatra/base'

class ChitterChatter < Sinatra::Base

  enable :sessions

  get "/" do
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peep_post' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/chitter'
  end


  run! if app_file == $0

end
