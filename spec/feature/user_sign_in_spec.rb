def sign_up(email: 'email@mail.com', password: 'super secret', password_confirmation: 'super secret' )
	visit '/users/sign_in'
	fill_in 'email', with: email
	fill_in 'password', with: password
	click_button 'Sign in'
end
feature "user sign in" do
  scenario "user should be able to sign in" do
    expect(page).to have_content("Welcome example@example.com")
  end
end
