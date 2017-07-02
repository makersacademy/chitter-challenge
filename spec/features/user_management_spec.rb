feature 'adding a user' do
  scenario 'I can sign up a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome johnsmith@aol.com')
    expect(User.first.email).to eq('johnsmith@aol.com')
  end
end
