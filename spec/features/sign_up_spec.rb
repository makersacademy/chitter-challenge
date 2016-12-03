# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "Signing Up" do

  scenario "I want to sign up for Chitter" do
    visit '/users/new'
    fill_in 'email', with: 'tester1@test.com'
    fill_in 'password', with: 'test123'
    fill_in 'name', with: 'Tester'
    fill_in 'username', with: 'tester1'
    click_button 'submit'

    expect(page.status_code).to eq 200
    expect(current_path).to include '/peeps'
    
  end

end
