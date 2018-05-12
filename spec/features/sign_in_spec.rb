feature 'Signing in to your account' do
  scenario 'displays sign in page' do
    visit '/chitter'
    click_on 'Sign in'
    expect(page).to have_content('Username')
  end
end
