feature 'Sign Up' do

  scenario 'displays welcome message when signing up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, newbie')
    expect(User.first.email).to eq('newbie@gmail.com')
  end


end
