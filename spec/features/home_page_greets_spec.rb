feature 'Home page' do
  scenario 'I want to sign up to Chitter from the homepage' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario 'I want to log in to Chitter from the homepage' do
    visit '/'
    click_button 'Sign in'
    expect(page).to have_content 'Sign in!'
  end

  scenario 'I want to views the latest Peeps' do
    visit '/'
    click_button 'View feed'
    expect(page).to have_content 'Peeps'
  end

end
