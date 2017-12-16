feature 'User sign up' do
  scenario 'new users can sign up and add username to chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, Lan')
    expect(User.first.email).to eq('lan@example.com')
    expect(User.first.username).to eq('Lan')
  end
end
