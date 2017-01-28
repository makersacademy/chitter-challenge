feature "users can log off" do
  scenario "user logs off" do
    sign_up
    visit'/'
    click_button 'log off'
    expect(page).to have_content "new user"
  end
end
