class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peep' do
    if current_user
        peep = Peep.create(peep: params[:peep], time: Time.new, user_id: current_user.id)
        redirect to'/'
      else
        flash.keep[:errors] = ['You must sign in to peep']
        redirect to '/'
      end
    end

end
