class Chitter < Sinatra::Base
  post '/comment' do
    @peep = Peep.current
    comment = Comment.create(body: params[:comment],
                             timestamp: Time.now.to_s[0, 16], user_id: @user.id)
    @peep.comments << comment
    @peep.save
    redirect "/peeps/#{@peep.id}"
  end

  post '/peep' do
    time = Time.now.to_s[0, 16]
    peep = Peep.create(body: params[:peep], timestamp: time)
    @user.peeps << peep
    @user.save
    redirect '/home'
  end
end
