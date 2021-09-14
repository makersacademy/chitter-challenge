require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/makers_students'

class ChitterMessage < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/students' do
    @students = Student.all
    erb(:students)
  end

  run! if app_file == $0
end