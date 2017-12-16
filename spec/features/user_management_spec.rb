feature 'User sign up' do
  scenario 'new users can sign up to chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, lan@example.com')
    expect(User.first.email).to eq('lan@example.com')
  end
end
