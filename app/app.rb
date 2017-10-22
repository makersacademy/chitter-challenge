ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/peep.rb'


class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :addpeep
  end

  post '/peeps' do
    Peep.create(message: params[:message], name: params[:name])
    redirect '/peeps'
  end





run! if app_file == $0
end
