module PeepsHelpers

  def add_peep message#, user_name = "Sanjay Purswani", user_handle = "sanjsanj"
    within('#new-peep') do
      @user = true
      fill_in 'message', with: message
      click_button 'Peep!'
    end
  end

end
