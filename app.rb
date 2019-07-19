require 'sinatra/base'
require './lib/peep'
require './lib/person'

class Chitter < Sinatra::Base

  get '/' do

    erb(:index)

  end

  get '/peep' do
    @peep = Peep.message
    erb(:peep)
  end

  get '/peep/new' do
    erb :"peep/new"
  end

  post '/peep' do
    Peep.create(url: params[:url])
    redirect '/peep'
  end

  post '/welcome' do
    @person = Person.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    erb :welcome
  end

  run! if app_file == $0

end
