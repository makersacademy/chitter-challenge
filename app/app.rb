require_relative 'datamapper_setup'
require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all(order:[:created_at.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(post:params[:post])
    redirect '/peeps'
  end

end
