# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

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
  
end
