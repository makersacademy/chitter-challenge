class Chitter < Sinatra::Base

  get '/' do
    @cheets = Cheets.all
    erb :cheets
  end

  get '/cheets/new' do
    erb :cheets_add
  end

  post '/new_cheet' do
    Cheets.create(cheet_user: params[:cheet_user], message: params[:message])
    redirect '/'
  end


end
