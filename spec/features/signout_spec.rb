feature 'user can log out' do
  scenario "log out takes you back to the peep wall no longer signed in" do
    visit('/users/new')
    fill_in 'email', with: "peeper@chitter.com"
    fill_in 'password', with: "password123"
    fill_in 'name', with: "Chit Peeper"
    fill_in 'username', with: "ChitPeep4eva"
    click_button 'join'
    click_button 'log out'
    expect(page).not_to have_content "welcome, Chit Peeper"
    expect(page).to have_button 'sign up'
  end
end
