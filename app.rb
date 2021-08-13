require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'
require './database_connection_setup'
require './lib/account'

class Chitter < Sinatra::Base
	configure :development do 
		register Sinatra::Reloader
	end

  enable :sessions
  set :port, 9301

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/home/:id' do
    p params
    Account.sign_up("#{params[:enter_name]}", "#{params[:enter_email]}")
    $accounts = Account.new("#{params[:enter_name]}", "#{params[:enter_email]}")
    erb :'home/personal'
  end

  get '/peep' do
    erb :peep
  end
  
  post '/home' do
    $accounts
    Peep.create(params[:enter_peep])
    @peeps = Peep.all
    erb :'home/public'
  end

  run! if app_file == $0
end