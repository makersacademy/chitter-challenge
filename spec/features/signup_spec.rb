feature 'Sign Up' do
  scenario 'User registers' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, john@doe.com'
    expect(User.first.email).to eq('john@doe.com')
  end
end
