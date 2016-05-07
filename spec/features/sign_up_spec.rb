require 'web_helper'

feature 'Users can sign up' do
  scenario 'I can sign up as a new User' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome First User')
    expect(User.first.email).to eq('user@email.com')
    expect(User.first.username).to eq('number1')
    expect(User.first.name).to eq('First User')
  end

end
