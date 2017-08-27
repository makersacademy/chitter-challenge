ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    erb :index
  end

  post '/signin' do
    puts 'signin'
    erb :signin
  end

  post '/signup' do
    erb :signup
  end

  get '/create_user' do
    user = User.create(name:     params[:name],
                       username: params[:user],
                       email:    params[:email],
                       password: params[:password])
    session[:current_user] = user.username
    session[:name] = user.name
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
    @peeps = Peep.all.sort_by { |peep| peep.id }.reverse!
    erb :peeps
  end

  post '/peeps' do
    @name = session[:name]
    @username = session[:current_user]
    Peep.create(content: params[:new_peep], user: @username, name: @name)
    @peeps = Peep.all.sort_by { |peep| peep.id }.reverse!
    erb :peeps
  end

  run! if app_file == $PROGRAM_NAME
end
