require 'sinatra'
require 'sinatra/reloader'
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
        repo = ChitterRepository.new
        peep = repo.all
        @contents = []
        peep.each do |p|
            @contents.push(p.contents)
        end 
        return @contents.reverse.join(', ')
    end

end