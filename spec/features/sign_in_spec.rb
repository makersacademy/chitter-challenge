feature "Signing In" do

  scenario "I want to successfully sign in to Chitter" do
    sign_up
    sign_in
    expect(current_path).to include '/peeps'
  end

  scenario "I want to fail to sign in to Chitter" do
    sign_up
    visit '/session/new'
    fill_in :email, with: 'tester1@test.com'
    fill_in :password, with: 'test999'
    click_button "Sign In"
    expect(current_path).to include '/session'
  end

end
