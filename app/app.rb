ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'data_mapper_setup'

# in app.rb
class App < Sinatra::Base

  enable :sessions

  def home_page(form, logged_in = false)
    @form = form
    @logged_in = logged_in
    @messages = session[:messages]
    session[:messages] = []
    erb :index
  end

  def log_in(form_hash)
    usr = User.first(
      username: form_hash[:username],
      pass_hash: form_hash[:password]
    )
    usr != nil
  end

  def register(form_hash)
    usr = User.create(
      name: form_hash[:name],
      email: form_hash[:email],
      username: form_hash[:username],
      pass_hash: form_hash[:password],
      salt: '',
    )
    usr.save
    true
  end

  get '/' do
    redirect '/login' unless session[:auth]
    home_page :new_post, true
  end

  get '/login' do
    redirect '/' if session[:auth]
    home_page :login
  end

  post '/login' do
    if log_in(params)
      session[:auth] = true
      redirect '/'
    else
      redirect '/login'
    end
  end

  get '/register' do
    redirect '/' if session[:auth]
    home_page :register
  end

  post '/register' do
    if register(params)
      redirect '/'
    else
      redirect '/register'
    end
  end
end
