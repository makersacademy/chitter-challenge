ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/signin' do
    user = User.new(name: params[:name], user: params[:user])
    user.save
    p user.user
    session[:user] = user.user
    "#{session[:user]}"
    redirect '/peeps'
  end

  get '/new' do
    erb :new
  end

  get '/peeps' do
    @user = session[:user]
    @peeps = Peep.all.sort_by{|peep|peep.id}.reverse!
    erb :peeps
  end

  post '/peeps' do
    @user = session[:user]
    peep = Peep.new(content: params[:new_peep])
    peep.save
    @peeps = Peep.all.sort_by{|peep|peep.id}.reverse!
    erb :peeps
  end

  run! if app_file == $PROGRAM_NAME
end