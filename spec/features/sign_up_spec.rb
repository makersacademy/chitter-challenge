feature 'Sign up' do
  scenario 'when submitting the sign up form' do
    visit '/'
    sign_up
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome kyaw')
  end

  scenario 'it creates the user account' do
    visit '/'
    sign_up
    expect(User.first.email).to eq('kyaw@gmail.com')
  end
end
