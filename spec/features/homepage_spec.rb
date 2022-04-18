feature "Homepage" do
  scenario "exists" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "can go to see the peeps without logging in" do
    visit '/'
    click_button 'Enter'
    expect(current_path).to eq '/peeps'
  end

  scenario "can go to the login page" do
    visit '/'
    click_button 'Log in'
    expect(current_path).to eq '/sessions/new'
  end

  scenario "can go to the sign up page" do
    visit '/'
    click_button 'Sign up'
    expect(current_path).to eq '/users/new'
  end
end
