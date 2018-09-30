feature "flash message" do
  it "flashes an error if email and username are already taken" do
    visit "/"
    fill_in 'username', with: '@flo'
    click_button "Submit"
    expect(page).to have_content ("That username has already been taken, please sign in again")
  end
end
