
ENV['RACK_ENV'] ||= "development"

require_relative 'datamapper_setup'

require 'sinatra/base'


class Chitter < Sinatra::Base
  # enable :sessions


  get '/peeps/new' do
    erb :'/add_peeps'
  end

  get '/peeps' do
    @new_peep = Peep.all
    erb :'/index'
  end


  post '/peeps' do
    @peepy =Peep.create(wording: params[:wording], timing: Time.now)
    redirect '/peeps'
  end




end
