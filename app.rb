require 'sinatra/base'
require_relative './lib/peep'
require './lib/database_connection_setup.rb'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :home
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    date = Time.now
    Peep.create(username: params['username'], content: params[:content], date: "#{date.month}/#{date.day}/#{date.year}")
    redirect '/peeps'
  end

  run! if app_file == $0

end
