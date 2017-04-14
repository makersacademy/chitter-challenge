module RollHelpers

  DEFAULT_MESSAGE = "Never Going to Give You Up"

  def post_roll(message: DEFAULT_MESSAGE)
    visit '/rolls/new'
    fill_in('new_roll', with: message)
    click_button 'Roll'

  end

end
