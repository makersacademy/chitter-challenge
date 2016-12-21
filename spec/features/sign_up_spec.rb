feature "Signing Up" do

  scenario "I want to sign up for Chitter" do
    sign_up
    expect(page.status_code).to eq 200
    expect(current_path).to include '/peeps'
  end

  scenario "Validate that username must be unique" do
    sign_up
    sign_up
    expect(page.status_code).to eq 200
    expect(current_path).to include '/users'
  end

  scenario "Validate that email must be unique" do
    sign_up
    sign_up
    expect(page.status_code).to eq 200
    expect(current_path).to include '/users'
    expect(page).to have_content "Email and/or username already taken"
  end

  scenario "Validate that password confirmation must match password" do
    expect{sign_up_wrong}.not_to change(User, :count)
  end

end
