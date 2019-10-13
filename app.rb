require 'sinatra'
require 'sinatra/flash'
require 'uri'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/index' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/new' do
    erb :'peeps/new'
  end

  post '/index' do
    Peep.create(text: params['peep'], time: Time.new.strftime("%m/%d/%Y %I:%M %p"))
    redirect '/index'
  end

  run! if app_file == $0
end
