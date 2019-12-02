module Message

  def peep(message: 'User first peep')
    visit '/message/new'
    fill_in 'message', with: message
    click_button('new peep')
  end
end
