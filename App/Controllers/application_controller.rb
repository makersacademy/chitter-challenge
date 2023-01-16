require 'sinatra'
require 'sinatra/activerecord'
require_relative '../models/user'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :views, "app/views"
    set :users, "users/"
    set :public_dir, "public"
  end
  # Homepage
  get '/' do
    User.all
  end

end