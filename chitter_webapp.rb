require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'


class ChitterApp < Sinatra::Base

  configure do
    enable :sessions
  end

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do
    session[:peeps] ||= []
    @peeps = session[:peeps]
    erb :peeps
  end

  post '/peeps/new' do
    session[:peeps] ||= []
    session[:peeps] << params[:peep]
    redirect '/peeps'
  end

  run! if __FILE__ == $0
end
