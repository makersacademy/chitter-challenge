require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './models/peep'
require_relative './models/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.create(params)
    redirect '/'
  end

  get '/peeps' do
    @peeps = Peep.order(created_at: :desc)
    erb :'peeps/index'
  end

  post '/peeps/new' do
    Peep.create(params)
    redirect '/peeps'
  end

  run! if app_file == $0
end
