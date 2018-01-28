ENV['RACK_ENV'] ||= 'development'

require './app/data_mapper_setup.rb'


require 'sinatra/base'
require 'database_cleaner'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :sign_up
  end

  post '/sign_up' do
    maker = Maker.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
    session[:name] = params[:name]
    session[:user_name] = params[:user_name]
    session[:maker_id] = maker.id
    maker.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @maker_name = session[:name]
    @maker_user_name = session[:user_name]
    erb :peeps
  end

  get '/peeps/new_peep' do
    erb :new_peep
  end

  post '/peeps' do
    maker = Maker.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
    params[:peeps].split("  ").each do |peep|
      maker.peeps << Peep.first_or_create(peep_name: peep, time: Time.now)
      end
    maker.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
