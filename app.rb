require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @date_and_time = session[:date_and_time]

    erb :"index"
  end

  post '/peeps' do
    Peep.add(text: params[:text])

    session[:date_and_time] = Time.new

    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  run! if app_file == $0
end
