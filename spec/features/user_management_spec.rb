feature 'User sign up' do
  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password and confirmation password do not match.'
  end

  scenario 'cannot sign up with a blank email address' do
    expect { sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario 'cannot sign up with an invalid email address' do
    expect {sign_up(email: "spock@starfleet")}.not_to change(User, :count)
  end

  def sign_up(username:'spock45', email: 'spock@starfleet.com', name: 'Spock',
    password: 'l0gicaL', password_confirmation: 'l0gicaL')
    visit '/signup'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
