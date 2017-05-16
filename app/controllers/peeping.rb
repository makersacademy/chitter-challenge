class Chitter < Sinatra::Base
  post '/comment' do
    @peep = Peep.current # Ah right — because you're storing state in `Peep` right? This is not so good. An ideal web application stores no state except in certain very well defined and idiomatic places (e.g. the session, the database). Also, this fails if more than one person tries to use the app at once, right?
    Comment.create(body: params[:comment], timestamp: Time.now.strftime("%F %T"), # Probably more idiomatic 
                   user_id: @user.id, peep_id: @peep.id)
    redirect "/peeps/#{@peep.id}"
  end

  post '/peep' do
    time = Time.now.to_s[0, 16]
    Peep.create(body: params[:peep], timestamp: time, user_id: @user.id)
    redirect '/home'
  end
end
