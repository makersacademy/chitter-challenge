feature 'user sign out' do
  scenario 'a logged in user can sign out' do
    user = build :user
    sign_in(user)
    click_on 'Sign out'
    expect(page).not_to have_content "What's up, #{user.username}?"
    expect(page).to have_content "Wall of Peeps"
  end
end
