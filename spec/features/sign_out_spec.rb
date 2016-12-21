feature "Signing Out" do

  scenario "I want to log out of Chitter" do
    sign_up
    sign_in
    click_button "Log Out"

    expect(current_path).to include '/peeps'

  end

end
