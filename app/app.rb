ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
# require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'
require_relative 'models/beep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/beeps' do
    erb :beeps
  end

  post '/beeps' do
    beep = Beep.create(body: params[:body], created_at: Time.now)
    redirect '/beeps'
  end

  get '/beeps/new' do
    erb :beeps_new
  end

  run! if app_file == $0
end
