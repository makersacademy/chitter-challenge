# frozen_string_literal: true

require 'sinatra/base'

# this is the chitter class
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/post_peep' do
    erb(:post_peep)
  end

  post '/post_peep' do
    session[:peep_text] = params[:peep_text]
    redirect '/view_peeps'
  end
  
  get '/view_peeps' do
    @peep = session[:peep_text]
    erb(:view_peeps)
  end

  run if app_file == $PROGRAM_NAME
end
