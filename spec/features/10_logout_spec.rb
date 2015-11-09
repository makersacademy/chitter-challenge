feature "maker can logout" do
  scenario "while being logged in" do
    valid_sign_up
    click_button 'Logout'
    expect(page).to have_content 'See you soon!'
    expect(page).not_to have_content 'Welcome, David Wright'
  end
end
