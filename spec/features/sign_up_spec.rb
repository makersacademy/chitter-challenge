feature '#sign_up' do
  scenario 'user signs up to Chitter' do
    visit '/'
    expect(page.status_code).to eq 200
    click_button "Create new account"
    fill_in :username, with: "spock45"
    fill_in :email, with: "spock@starfleet.com"
    fill_in :name, with: "Spock"
    fill_in :password, with: "l0gicaL"
    click_button 'Sign up'
    expect(page).to have_content("Welcome to Chitter!")
    expect(User.first.username).to eq("spock45")
  end
end
