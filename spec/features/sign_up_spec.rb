feature 'Signing up' do
  scenario 'a user can sign up' do
    visit '/sign_up'
    fill_in('username', with: 'Josenewmano')
    fill_in('name', with: 'Joseph Newman')
    fill_in('email', with: 'definitelyarealemail@email.com')
    fill_in('password', with: 'reallygoodpassword')
    click_button('Join Chitter')

    expect(page).to have_content "Welcome back to Chitter Josenewmano!"
  end

end