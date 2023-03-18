require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/chitter_repository'

DatabaseConnection.connect

class Application < Sinatra::Base 
    
    configure :development do
        register Sinatra::Reloader
        also_reload 'lib/user_repository'
        also_reload 'lib_chitter_repository'
    end
    get '/peeps' do
       repi = ChitterRepository.new
       repos = UserRepository.new
       a_user = repos.all
       peepi = repi.all
       @contents = []
       @user_name = []
       a_user.each do |u|
        @user_name.push(u.user_name)
       end
       num = 0
       peepi.each do |p|
        
        @contents.push("#{@user_name[num]}: #{p.contents}. sent: #{p.time}")
        num += 1
        end
       
        return erb(:index)
    end
    get '/create' do
    return erb(:index1)
    end

    post '/create' do
        repo = ChitterRepository.new
        a_chitter = Chitter.new
        a_chitter.contents = params["the_peep"]
        a_chitter.time = params["peep_time"].to_f
        a_chitter.user_id = params["the_user_id"].to_i
        repo.create(a_chitter)
        return erb(:index)
    end
    get '/home' do
        return erb(:homepage)

    end


end