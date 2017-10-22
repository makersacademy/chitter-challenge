require 'sinatra/base'
require_relative 'models/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/peeps' do
    new_peep = Peep.create(peep: params[:peep])
    new_peep.save
    # session[:user] = params[:user]
    # session[:peep] = params[:peep]
    redirect '/peeps/new'
  end

  get '/peeps/new' do
    @all_peeps = Peep.all
    # @user = session[:user]
    # @peep = session[:peep]
    erb :peeps_new
  end

run! if app_file == $0
end
