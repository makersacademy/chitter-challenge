module PeepHelpers
  def create_peep(message)
    visit '/peeps'
    find('#newPeepBtn').click
    fill_in :message, with: message
    click_button 'Post'
  end
end
