ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/signin' do
    user = User.first_or_create(name: params[:name], username: params[:user])
    session[:current_user] = user.username
    puts "Session currect user is #{session[:current_user]}"
    redirect '/peeps'
  end

  get '/new' do
    erb :new
  end

  post '/signout' do
    session[:current_user] = nil
    redirect '/peeps'
  end

  get '/peeps' do
    @username = session[:current_user]
    @peeps = Peep.all.sort_by{|peep|peep.id}.reverse!
    erb :peeps
  end

  post '/peeps' do
    @username = session[:current_user]
    Peep.create(content: params[:new_peep], user: @username)
    @peeps = Peep.all.sort_by{|peep|peep.id}.reverse!
    erb :peeps
  end

  run! if app_file == $PROGRAM_NAME
end