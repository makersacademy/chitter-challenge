require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

ENV["RACK_ENV"] ||= "development"

class ChitterChallenge < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(:message => params[:message])
    peep.save
    redirect '/peeps'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
