ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra'
require_relative 'data_mapper_setup'

class ChitterWebsite < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all(:order => [:id.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(
      :message => params[:message],
      :created_at => Time.new
    )
    redirect '/peeps'
  end

  get '/sign_up' do
    erb :'users/sign_up'
  end

  post '/account_setup' do
    User.create(
      :name => params[:name],
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    )
    redirect '/welcome'
  end

  get '/welcome' do
    @user = User.first
    erb :'users/welcome'
  end
end
