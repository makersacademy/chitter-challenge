require 'sinatra/base'
require 'pg'
require_relative '../lib/peeps.rb'

class Chitter < Sinatra::Base

  ENV['DATABASE'] ||= 'chitter'

  get('/') do
    erb(:index)
  end

  post('/') do
    Peeps.add(params['compose_tweet'])
    redirect('/')
  end

  run! if app_file == $0
end