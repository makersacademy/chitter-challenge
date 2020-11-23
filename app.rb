require 'sinatra/base'
require 'pg'
require_relative './lib/peep'

class App < Sinatra::Base

  attr_reader :content, :author

  get '/' do
    @connection = PG.connect(dbname: 'chitter')
    result = @connection.exec("SELECT content FROM peeps;")
    p @peeps = Peep.all
    erb(:index)
  end

  post '/new' do
    the_peep = params[:new_peep]
    author = params[:author]
    @connection = PG.connect(dbname: 'chitter')
    @connection.exec("INSERT INTO peeps (author, content) VALUES('#{author}','#{the_peep}');")
    redirect '/'
  end
end
