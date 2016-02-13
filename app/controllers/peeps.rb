class ChitterApp < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps/new' do
    Peep.create(
      message: params[:message],
      datetime: Time.now)
    redirect to('/peeps')
  end
end
