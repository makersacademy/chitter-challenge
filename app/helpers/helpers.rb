helpers do

  def prepare_feed
    @all_peeps = Peep.all
    @all_peeps.reverse!
    @all_users = User.all
  end

  def prepare_public_feed
    prepare_feed
    @public_feed = []
    @all_peeps.each do |peep|
      @public_feed << peep if peep.receiver == 'public'
    end
  end

  def prepare_private_feed(sender, receiver)
    prepare_feed
    @private_feed = []
    @sender, @receiver = sender, receiver
    @all_peeps.each do |peep|
      if (peep.receiver == @receiver && peep.sender == @sender) || (peep.receiver == @sender && peep.sender == @receiver)
        @private_feed << peep
      end
    end
  end

  def create_peep(sender, receiver)
    message = params[:message]
    if message && message.length > 140
      flash[:error] = 'Peeps must be less than 140 characters'
      redirect to '/main'
    end
    @sender, @receiver = sender, receiver
    Peep.create(message: message,
                time: Time.now,
                user_id: session[:id],
                receiver: @receiver,
                sender: @sender)
  end

end