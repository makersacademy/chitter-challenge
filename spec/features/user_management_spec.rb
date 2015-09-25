require_relative '../../app/data_mapper_setup'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Emily')
    expect(User.first.email).to eq('emily@test.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'emily@test.com',
              username: 'Emily',
              password: '1234',
              password_confirmation: '1234')
    visit '/users/new'
    fill_in :email,     with: email
    fill_in :username,  with: username
    fill_in :password,  with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
