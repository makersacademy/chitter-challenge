feature 'user can sign_up for chitter account' do
  scenario 'so that user can post to chitter, they can sign up for an account' do
    visit '/'
    click_button 'Sign up for a Chitter Account'
    expect(page).to have_button 'Sign Up!'
  end
end
