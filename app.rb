require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    @peep_content = params[:content]
    erb :index
  end

  post '/peeps' do
    redirect "/?content=#{params[:content]}"
  end

end
