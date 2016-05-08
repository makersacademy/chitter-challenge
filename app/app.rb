ENV["RACK_ENV"] ||= "development"
require 'sinatra'
#require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  get '/' do
    'hello!, sign up to chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/new' do
  erb :'peeps/new'
end

post '/new' do
  Peep.create(content: params[:content], created_at: Time.now,)
  redirect to('/peeps')
end

  run! if app_file == $0
end