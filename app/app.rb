ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    @peeps = Peep.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    peep = Peep.create(message: params[:message])
    peep.save
    redirect '/posts'
  end

end
