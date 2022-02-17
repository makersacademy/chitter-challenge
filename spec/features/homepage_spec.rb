feature "the homepage" do
  scenario "users chooses to sign up or sign in" do
    visit '/'
    expect(page).to have_button "sign up"
    expect(page).to have_button "sign in"
  end
end