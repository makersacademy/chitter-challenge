#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get "/" do 
   erb "Hello world"
  end

  run! if app_file ==$0

end
