feature 'user can sign out' do

  scenario 'after signing in' do
    user = create :user
    sign_in(user)
    click_button 'Log out'
    expect(page).to have_content "Goodbye!"
    expect(page).not_to have_content "Welcome, #{user.username}!"
  end
end