def create_peep
  visit('/')
  click_button('add')

  fill_in('content', with: 'Peep!')
  click_button('submit')
end

def register_new_user

  visit('/users/new')
  fill_in("email", with:"email@gmail.com")
  fill_in("password", with:"password")
  click_button ('submit')
  expect(page).to have_content('Welcome, email@gmail.com')

end
