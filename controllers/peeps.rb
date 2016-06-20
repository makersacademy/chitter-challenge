class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.first_or_create(message: params[:message])
    peep.user = current_user
    peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

end
