ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require './models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

TIME_STAMP_FORMAT = "%d/%m/%Y at %l:%M%P"

  get '/users/new' do
    erb :new_user
  end

  post '/users/new' do
    @new_user = User.new(username:          params[:username],
                         email:             params[:email],
                         password:          params[:password],
                         password_confirm:  params[:password_confirm])
    if @new.save

    else

    end
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

end
