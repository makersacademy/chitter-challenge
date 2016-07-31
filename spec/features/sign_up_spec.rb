require_relative '../web_helper.rb'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, JoeBloggs93!')
    expect(User.first.email).to eq('test@example.com')
  end

  scenario 'User confirms with incorrect password' do
    expect { sign_up_confirmation_wrong }.not_to change(User, :count)
    expect(page).to have_content('Password and confirmation password do not match')
    expect(current_path).to eq '/users'
  end
end
