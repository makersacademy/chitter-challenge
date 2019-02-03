module Helpers

  def enter_chitter
    visit('/')
    click_button('see peeps')
  end
  
  def go_to_add_peep_page
    enter_chitter
    click_button('sign up')
    fill_in('name', with: 'Erin')
    fill_in('username', with: 'ES94')
    fill_in('email', with: 'estevenson@hotmail.com')
    fill_in('password', with: 'password123')
    click_button('submit')
    click_button('add new peep')
  end

end
