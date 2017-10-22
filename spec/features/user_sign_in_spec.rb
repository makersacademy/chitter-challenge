feature 'Users sign in' do
  scenario 'New users can sign in with a safe password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello boop@boopmail.com')
    expect(User.first.email).to eq('boop@boopmail.com')
  end
end
