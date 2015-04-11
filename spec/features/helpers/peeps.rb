module PeepsHelpers

  def add_peep message
    within('#new-peep') do
      @user = true
      fill_in 'message', with: message
      click_button 'Peep!'
    end
  end

end
