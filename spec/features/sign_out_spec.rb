feature 'User signs out' do
  scenario 'while being signed in' do
    user = create(:user)
    visit '/sessions/new'
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, #{user.handle}')
  end
end
