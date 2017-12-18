feature 'User sign up' do
  scenario 'A new user can be registered' do
    expect{ sign_up }.to change(User, :count).by (1)
    expect(page).to have_content('Welcome jimmy_the_dude@cool.com')
    expect(User.fisrt.email).to eq('jimmy_the_dude@cool.com')
  end
end
