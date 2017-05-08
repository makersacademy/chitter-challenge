require './spec/web_helpers'

feature 'Sign up to Chitter' do
  scenario 'A new user can sign up to Chitter' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter Alice LeBon!')
    expect(User.first.email).to eq('alice@lebonbon.com')
    expect(User.first.name).to eq('Alice LeBon')
    expect(User.first.user_name).to eq('AliceLB87')
  end
end
