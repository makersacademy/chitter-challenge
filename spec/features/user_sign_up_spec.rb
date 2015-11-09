feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(User.first.email).to eq('ry@ry.com')
  end
end