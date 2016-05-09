class Chitter < Sinatra::Base

  #peeps
  
  get '/peeps/index' do
    @peeps = Peep.all(order: [:created_at.desc], reply_to: nil)
  	erb :'peeps/index'
  end

  post '/peeps' do    
    #peep belongs to user, but for some ungodly reason new_peep.user=current_user does not work
    #I get no errors in new_peep, it properly assigns the user_id, but its own id is nil
    current_user.peeps << Peep.create(content: params[:content], created_at: Time.now, user_id: current_user.id)
    current_user.save
    redirect '/peeps/index'
  end

  #filtering peeps

  post '/peeps/mine' do
    redirect "/peeps/#{current_user.username}"
  end

  get '/peeps/:username' do
    @peeps = User.first(username: params[:username]).peeps(order: [:created_at.desc], reply_to: nil)
    erb :'peeps/index'
  end

  #replying

  get '/peeps/reply/:reply_to' do
    @reply_to = params[:reply_to]
    erb :'peeps/reply'
  end

  post '/peeps/reply/:reply_to' do
    reply_to = Peep.get(params[:reply_to])
    reply_to.replies << Peep.create(content: params[:content], created_at: Time.now, user_id: current_user.id)
    reply_to.save
    redirect '/peeps/index'
  end

end