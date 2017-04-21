class Knitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    @replys = Reply.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    unless current_user
      flash.keep[:login] = 'Please sign up or log in to add a tip'
      redirect '/users/new'
    else
      erb :'peeps/new'
    end
  end

  post '/peeps' do
    new_text = params[:text]
    peep = Peep.create(text: new_text, time: Peep.set_time)
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end

  # post '/replys' do
  #   @this_peep = Peep.first(id: sessions[:peep_id])
  #   session[:pad_id] = params[:id]
  #   reply = Reply.create(text: new_reply, time: Reply.set_time)
  #   current_peep.replys << reply
  #   current_peep.save
  #   redirect '/peeps'
  # end

end
