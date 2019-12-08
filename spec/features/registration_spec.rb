feature 'Registration' do

  scenario "sign up a new user" do
    visit '/users/new'
    fill_in 'email', with: 'samm@makersacademy.com'
    fill_in 'password', with: 'password123'
    fill_in 'name', with: 'Sam Morgan'
    fill_in 'username', with: 'sjmog'
    click_button 'Submit'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, sjmog'
  end

end
