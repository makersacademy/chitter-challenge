feature 'log out' do
  scenario 'user logs out' do
    new_user
    log_in
    click_button "Log out"
    expect(current_path).to eq '/'
    visit '/home'
    expect(page).to_not have_content "What's crappening?"
  end
end