require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peeps'
require_relative 'lib/users'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/comment' do
    erb :comment
  end

  post '/comment' do
    post_time = Time.now
    post_time = post_time.strftime("%k:%M:%S")
    @username = Users.instance.username
    Peep.create(post_time: post_time, message: params[:message], username: @username)
    redirect('/peeps')
  end

  post '/signup' do
    Users.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
