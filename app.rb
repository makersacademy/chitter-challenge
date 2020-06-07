# frozen_string_literal: true

require 'sinatra/base'
require './lib/chitter.rb'

class ChitterBox < Sinatra::Base
  get '/' do
    @posts = Chitter.all
    erb :index
  end

  post '/new' do
    @new = Chitter.create(params[:content])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
