require 'sinatra'
require './lib/peep'
require './lib/DBhelper'


class Chitter < Sinatra::Base

  get '/' do
    "Hello World"
  end

  get '/home' do
    "hello"
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/redirect/new_peep' do
    title = params[:title]
    body = params[:body]

    DBhelper.new_peep(Peep.new(title, body))
    redirect '/home'
  end
end
