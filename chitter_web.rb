require 'sinatra/base'
require 'pg'

class ChitterWeb < Sinatra::Base

  def connection_helper
    if ENV['CHITTER_ENVIRON'] == 'test' 
      dbname = 'chitter_test'
    else
      dbname = 'chitter'
    end
    @conn = PG.connect(dbname: dbname)
  end

  get '/chitter/peep/new' do
    erb(:new_peep)
  end

  post '/chitter/peep/new' do
    connection_helper
    message = params[:message]
    @conn.exec("INSERT INTO peep (message, posted_by) values('#{message}', 1);")
    p "I am here in peep new"
    redirect '/peep/all'
  end

  get '/peep/all' do
    connection_helper
    result = @conn.exec("SELECT * FROM peep;")
    @all_peeps = result.map do |result_row|
      {id: result_row['id'], message: result_row['message'], timeposted: result_row['time_posted'], postedby: result_row['posted_by']}
    end
    erb(:all_peeps)
  end

  run! if app_file == $0
end
