class ChitterApp < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message],
                       time: Time.new.strftime("%e %b %Y %H:%M%p"),
                       author: current_user.username,
                       user_id: current_user.id)
    redirect '/peeps'
  end

end
