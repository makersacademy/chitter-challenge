feature 'sign up' do
  scenario 'signing up' do
    visit '/'
    expect(page).to have_content('Chitter')
  end

  scenario 'register online' do
    visit '/'
    click_button('Sign up')
    expect(page).to have_content('Register')
  end
end
