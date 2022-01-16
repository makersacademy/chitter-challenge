  def post_a_peep
    visit('/')
    fill_in 'peep', with: "World's smartest peep"
    click_button('Submit')
  end