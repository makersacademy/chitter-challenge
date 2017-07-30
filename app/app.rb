require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/feed' do
    @peeps = Peep.all.sort { |a, b| b.time_created <=> a.time_created }
    erb :feed
  end

  post '/feed' do
    puts "Time now: #{Time.now}"
    Peep.create(message: params[:message], time_created: Time.now)
    redirect '/feed'
  end
end
