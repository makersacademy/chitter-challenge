feature 'Sign in' do
  scenario 'signing in' do
    register
    sign_in
    expect(page).to have_content('Welcome, andy')
  end
end