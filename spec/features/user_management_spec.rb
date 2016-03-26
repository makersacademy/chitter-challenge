require 'web_helper'

feature 'User sign up' do
  scenario 'new user sign up' do
    visit '/users/new'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Humpty Dumpty!')
    expect(User.first.email).to eq('humptydumpty@wall.com')
  end
end
