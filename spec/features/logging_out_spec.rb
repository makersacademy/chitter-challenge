feature 'sign out' do
  before do
    sign_up
    log_in('Dave', '12345')
  end
  scenario 'user signs out' do
    click_button "Sign Out"
    expect(page).to have_content "You have been signed out"
  end
end
