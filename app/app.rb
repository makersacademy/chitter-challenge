require 'data_mapper'
require 'sinatra/base'
require_relative './models/peep.rb'


class Chitter < Sinatra::Base

  get '/' do
    'You arrived at the homepage'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:new)
  end

  post '/peeps' do
    peep = Peep.new(title: params[:title], text: params[:text])
    peep.save
    redirect to('/peeps')
  end

  run! if app_file == $PROGRAM_NAME
end
