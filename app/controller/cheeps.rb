class App < Sinatra::Base

  get '/cheeps' do
    @cheeps = Cheep.all
    erb :'cheeps/index'
  end

  post '/cheeps/new' do

    if current_user
      cheep = Cheep.create(cheep: params[:cheep], time: Time.new, user_id: current_user.id)
      redirect to'/cheeps'
    else
      flash.keep[:errors] = ['Murray says no, you need to be signed in!!!!!']
      redirect to '/'
    end

  end

end
