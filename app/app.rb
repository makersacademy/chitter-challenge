ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    hashtags = params[:hashtags].gsub(/\s/,'').split(',')
    hashtags.each do |hashtag|
      peep.hashtags << Hashtag.first_or_create(name: hashtag)
    end
    peep.save
    redirect '/peeps'
  end

  get '/hashtags/:name' do
    hashtag = Hashtag.first(name: params[:name])
    @peeps = hashtag ? hashtag.peeps : []
    erb :'/peeps/index'
  end
end
