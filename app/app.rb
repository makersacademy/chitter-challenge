ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra'
require_relative './models/peep'

class ChitterWebsite < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all(:order => [ :id.desc ])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(
      :message => params[:message]
      # :created_at => Time.new
    )
    redirect '/peeps'
  end
end
