feature 'Home page' do
  scenario 'I want to sign up to Chitter from the homepage' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_content 'Sign up to Chitter'
  end
end
