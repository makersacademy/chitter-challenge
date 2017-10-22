ENV["RACK_ENV"] ||= "test"

require 'sinatra/base'
require_relative './models/peep.rb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @all_peeps = Peep.all
  end

  get '/peeps/new' do
    erb(:new_peep)
  end

  post '/peeps' do
    peep = Peep.create(text: params[:text])
    peep.save
    redirect '/peeps'
  end

end
