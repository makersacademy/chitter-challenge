feature 'sign up' do
  scenario 'signing up' do
    visit '/'
    expect(page).to have_content('Chitter')
  end

  scenario 'register online' do
    visit '/'
    click_button('Sign up')
    expect(page).to have_content('Join Chitter today')
  end

  scenario 'sign up and return to home page' do
    visit '/'
    click_button('Sign up')
    fill_in('name', with: 'Sam')
    fill_in('email', with: 'sammy_nlh@hotmail.com')
    fill_in('password', with: 'yolo')
    click_button('Sign up')
    expect(page).to have_content('Sam')
  end
end
