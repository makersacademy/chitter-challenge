feature '#sign_up' do
  scenario 'user signs up to Chitter' do
    visit '/'
    expect(page.status_code).to eq 200
    click_button "Create new account"
    fill_in :username, with: "spock45"
    fill_in :email, with: "spock@starfleet.com"
    fill_in :name, with: "Spock"
    fill_in :password, with: "l0gicaL"
    fill_in :password_confirmation, with: "l0gicaL"
    click_button 'Sign up'
    expect(page).to have_content("Welcome to Chitter!")
    expect(User.first.username).to eq("spock45")
  end

  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end

  def sign_up(username:'spock45', email: 'spock@starfleet.com', name: 'Spock',
    password: 'l0gicaL', password_confirmation: 'l0gicaL')
    visit '/signup'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
  end
end
