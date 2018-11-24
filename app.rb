require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/add-peep' do
    date = Time.now
    Peep.create(username: params['username'], content: params[:content], date: "#{date.month}/#{date.day}/#{date.year}")
    redirect '/peeps'
  end

end
