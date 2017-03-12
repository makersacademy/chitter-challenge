ENV["RACK_ENV"] ||= 'development'

require "sinatra/base"
require './app/models/peep'
require_relative "helpers/dm_config"

class ChitterApp < Sinatra::Base
  enable :sessions #not yet needed.

  get '/' do
    redirect '/post-peep'
  end

  get '/homepage' do
    @peeps = Peep.all
    erb :homepage
  end

  get '/post-peep' do
    erb :post_peep
  end

  post '/posted-peep' do
    @peep = Peep.create(peep_content: params[:peep_content], time_peeped: Time.now)
    @peep.save
    #Above will also have functionality to save username to peep.
    redirect '/homepage'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
