ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'BCrypt'

require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

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
    pep = Peep.create(mess: params[:mess], created_at: Time.now)
    pep.save
    redirect '/peeps'
  end

end
