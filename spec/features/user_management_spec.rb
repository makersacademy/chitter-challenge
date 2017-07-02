feature 'adding a user' do
  scenario 'I can sign up a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome johnsmith@aol.com')
    expect(User.first.email).to eq('johnsmith@aol.com')
  end

  scenario 'requires a matching confirmation password' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end
  
end
