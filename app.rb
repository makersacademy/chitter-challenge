
ENV['RACK_ENV'] ||= "development"

require_relative 'datamapper_setup'

require 'sinatra/base'


class Chitter < Sinatra::Base
  # enable :sessions


  get '/peep/new' do
    erb :'/add_peeps'
  end

  get '/peeps' do
    @new_peep = Peep.all
    erb :'/index'
  end


  post '/peep' do
    @peepy =Peep.create(wording: params[:wording])
    p @peepy
    redirect '/peeps'
  end




end
