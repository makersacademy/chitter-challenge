ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/home' do
    @peeps = Peep.all
    erb :home
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep/new' do
    peep = Peep.create(message: params[:peep], created_at: Time.new)
    peep.save
    redirect '/home'
  end

  run! if app_file == $0
end
