# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do

  xscenario 'user s signs up for chitter' do
    visit 'users/new'
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Hello, g@hotmail.com'
    expect(User.first.email).to eq 'g@hotmail.com'

  end
end
