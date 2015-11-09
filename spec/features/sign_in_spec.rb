feature 'Sign in' do
  scenario 'signing in' do
    register
    sign_in
    expect(status_code).to eq 200
    expect(page).to have_content('Welcome, andy')
  end
end