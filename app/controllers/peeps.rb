class Chitter < Sinatra::Base

  get '/peeps/new' do
    flash.next[:peep_id] = params[:peep_id]
    erb :'peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    current_user.peeps.create(message: params[:message],
                              parent_peep: flash[:peep_id])
    redirect('/peeps')
  end

end
