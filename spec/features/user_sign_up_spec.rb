
feature 'A new user signing up' do

  scenario 'filling in the sign-up form' do

    expect{ sign_up }.to change(User, :count).by 1
    expect(User.first.name).to eq('Sean')
    expect(User.first.username).to eq('seanh')
    expect(User.first.email).to eq('s@s.com')
    expect(page).to have_content('Welcome Sean.')

  end

end
