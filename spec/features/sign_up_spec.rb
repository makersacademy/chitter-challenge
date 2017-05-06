feature 'Sign up to Chitter' do
  scenario 'User submits form to sign up to Chitter' do
    sign_up
    expect(page.status_code).to eq 200
  end
end
