class Chitter < Sinatra::Base

  get '/peeps/new' do
    if current_user
      @user = current_user
      erb :'peeps/new'
    else
      redirect to('/sessions/none')
    end
  end

  post '/peeps/new' do
    peep = Peep.new(message: params[:peep],
                    name: params[:name],
                    username: params[:username])
    peep.save
    redirect to('/chitter')
  end
  
end