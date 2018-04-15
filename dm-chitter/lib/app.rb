require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require 'pry'
require 'data_mapper'
require_relative 'chitter'

class Controller < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  Chitter.connect

  get '/' do
    erb :index
  end

  post '/add_cheet' do
    if params[:content].length < 1
      flash[:message] = "The tweet is too short."
    elsif params[:content].length >= 240
      flash[:message] = "The tweet is too long. Ensure tweet < 240 characters"
    else
      flash[:message] = "The tweet was successfully added."
      Chitter.add(Chit.new(params[:content]))
    end
    redirect '/'
  end

  run if $app_file == 0

end
