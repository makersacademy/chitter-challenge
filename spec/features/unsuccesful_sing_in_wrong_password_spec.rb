
feature 'allows sign in' do
  scenario 'sign in with wrong password' do
    register_new_user
    visit '/sessions/new'
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'wrong_password')
    click_button 'sign_in'
    expect(page).to have_content 'Check your email or password.'
  end
end
