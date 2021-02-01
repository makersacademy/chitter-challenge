feature 'Signing Up' do
  scenario 'Lets user you sign up' do
    visit('/')
    click_button('Sign Up')
    fill_in('username', with: 'dude')
    fill_in('firstname', with: 'Someone')
    fill_in('secondname', with: 'Something')
    fill_in('email', with: 'Karsten@makersacademy.com')
    click_button('Join')
    expect(page).to have_content "Hello dude"
  end
end