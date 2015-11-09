module MessageHelpers
  
  def peep(message: 'My first peep')
    visit '/message/new'
    fill_in 'message', with: message
    click_button('New peep')
  end

end
