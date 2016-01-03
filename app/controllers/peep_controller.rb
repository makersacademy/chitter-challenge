class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    if current_user
      Peep.create!(message: params[:message], user: current_user, time: Time.new)
      redirect to('/peeps')
    else
      flash[:errors] = ['Please sign in to peep']
      redirect to('/sessions/new')
    end
  end
end
