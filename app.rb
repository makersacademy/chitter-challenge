require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Chitter"
  end

  get '/comment' do
    erb :comment
  end

  post '/comment' do
    post_time = Time.now
    post_time = post_time.strftime("%k:%M:%S")
    Peep.create(post_time: post_time, message: params[:message], username: params[:username])
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
