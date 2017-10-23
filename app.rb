# ENV["RACK_ENV"] ||= "development", created_at: DateTime

require 'sinatra/base'
require 'data_mapper'
require './app/models/peep'
require 'time'

class ChitterChallenge < Sinatra::Base
  # get '/' do
  #   erb(:home)
  # end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    @peeps = Peep.create(message: params[:message])
    # tried created_at: Time.new to do time stamps
    redirect '/peeps'
    end
  end
