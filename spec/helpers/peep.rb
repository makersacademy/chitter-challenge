module PeepHelpers
  def create_peep(message)
    visit '/peeps'
    find('#newPeepBtn').click
    fill_in :message, with: message
    # fill_in :tag, with: 'Austin'
    click_button 'Post'
  end
end
