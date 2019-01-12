feature 'User authentication' do
  scenario 'page shows sign in and sign up options' do
    visit '/'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Sign up'
  end
end