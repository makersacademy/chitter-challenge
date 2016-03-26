feature 'sign in' do

  scenario 'the person can log in and will be taken to the chitter-feed page' do
  	sign_up
  	click_button ("Sign out")
		click_button ("Log in")
		fill_in('email', with: 'bob@gmail.com' )
    fill_in('password', with: 'bobByg' )
    click_button ("Log-in")
  	expect(page).to have_button('Welcome BBY')
  end

end