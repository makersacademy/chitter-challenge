feature 'visiting the home page' do
  scenario 'see page title' do
    visit '/'
    expect(page).to have_content('Chitter')
  end

  scenario 'can click sign up button ' do
    visit '/'
    click_button 'Sign Up'
    expect(page).to have_current_path('/sign-up')
    expect(page).to have_content 'Sign up to Chitter'
  end

end
