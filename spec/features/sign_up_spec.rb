feature 'sign up form' do
  scenario 'users can sign up' do
    visit '/sign-up'
    fill_in 'email', :with => 'elizabeth@makers.com'
    fill_in 'url', :with => 'password'
    click_button 'Sign up'
  end
end
