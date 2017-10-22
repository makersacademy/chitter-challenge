ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/peep'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
  @peeps = Peep.all
  erb :'peeps/index'
  end

  get'/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(name: params[:name], username: params[:username],
    message: params[:message], time: Time.new.strftime("%I:%M%p"))
    redirect '/peeps'
  end

  get '/maker/new' do
    erb :'maker/new'
  end

  post '/makers' do
    maker = Maker.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      session[:maker_id] = maker.id
    redirect to ('/peeps')
  end

  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end

end
