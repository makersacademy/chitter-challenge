=begin
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
=end
feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, yuliya@example.com')
    expect(User.first.email).to eq('yuliya@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'yuliya@example.com',
              password: 'hitter!',
              password_confirmation: 'hitter!')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Wanna PeeP? Sign up'
  end
end
