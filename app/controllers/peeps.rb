class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all(:order =>[:created_at.desc], :limit => 10)
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message], user_id: current_user.id)
    current_user.peeps << peep
    peep.save
    redirect '/peeps'
  end
end
