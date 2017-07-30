ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :peeps
  end

  post '/peep' do
    peep = Peep.create(message: params[:peep], time: "#{Time.new.hour}:#{Time.new.min}")
    redirect ('/')
  end

  run! if app_file == $0
end
