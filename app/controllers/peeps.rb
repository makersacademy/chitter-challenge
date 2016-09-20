class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    current_user.peeps.create(message: params[:message])
    redirect '/peeps'
  end

end
