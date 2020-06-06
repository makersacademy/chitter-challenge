require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :homepage
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(title: params['title'], peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0
end