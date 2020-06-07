# frozen_string_literal: true

require 'sinatra/base'
require './lib/chitter.rb'

class ChitterBox < Sinatra::Base
  
  get '/' do
    erb :sign_in
  end
  
  
 


  
  
  
  get '/posts' do
    @posts = Chitter.all
    erb :index
  end

  post '/posts' do
    redirect '/posts'
  end

  post '/new' do
    @new = Chitter.create(params[:content])
    redirect '/posts'
  end

  run! if app_file == $PROGRAM_NAME
end
