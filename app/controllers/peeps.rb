class ChitterApp < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    if current_user
      erb :'/peeps/new'
    else
      flash.now[:nouser] = 'Please sign in to post a peep.'
    end
  end

  post '/peeps/new' do
    Peep.create(
      message: params[:message],
      datetime: Time.now)
    redirect to('/peeps')
  end
end
