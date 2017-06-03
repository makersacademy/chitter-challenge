ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
TIME_FORMAT = '%e-%b-%Y %I:%M:%S %p'

class Chitter < Sinatra::Base
  enable :sessions
  set :public_folder, Proc.new { File.join(root, 'static') }

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message],
                    time: Time.now)
    peep.save
    redirect '/peeps'
  end


  run! if app_file == $0
end
