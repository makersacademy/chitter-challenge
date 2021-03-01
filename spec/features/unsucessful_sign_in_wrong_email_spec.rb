

feature 'allows sign in' do
  scenario 'sign in with wrong email' do
    register_new_user
    visit '/sessions/new'
    fill_in('email', with: 'wrong@gmail.com')
    fill_in('password', with: 'password')
    click_button 'sign_in'
    expect(page).to have_content 'Check your email or password.'
  end
end
