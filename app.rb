require 'sinatra'

class Chitter < Sinatra::Base

  get ('/homepage') do
    erb :index
  end

  get ('/homepage/sign_up') do
    erb :'homepage/sign_up'
  end

  post ('/homepage/logged_in') do
    @username = params[:username]
    erb :'homepage/logged_in'
  end


end
