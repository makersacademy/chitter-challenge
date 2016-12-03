feature "Signing In" do

  scenario "I want to successfully sign in to Chitter" do
    sign_up
    sign_in

    expect(current_path).to include '/peeps'

  end

end
