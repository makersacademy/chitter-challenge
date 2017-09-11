class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    current_user.peeps << Peep.first_or_create(message: params[:message], time_stamp: Peep.time)
    current_user.save
    redirect '/peeps'
  end
  
end
