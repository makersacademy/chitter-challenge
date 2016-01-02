class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create!(message: params[:message], user: current_user)
    redirect to('/peeps')
  end
end
