
feature "#homepage" do
  scenario "finds \"Chitter\" on homepage" do
    visit '/'
    expect(page).to have_content("Chitter")
  end

  scenario "clicking log in takes user to log in page" do
    visit '/'
    click_button("Log In")
    expect(current_path).to eq('/sessions/new')
  end

end
