feature 'Confirmation password' do

  scenario 'Flash message if passwords do not match' do
    visit('/user/new')
    fill_in('username', with: "Magnus")
    fill_in('email', with: "mail@magnusholm.com")
    fill_in('password', with: "123banana")
    fill_in('password_confirmation', with: "123apple")
    click_button('Sign up')
    expect(page).to have_content("Passwords didn't match, please try again")
  end
end
