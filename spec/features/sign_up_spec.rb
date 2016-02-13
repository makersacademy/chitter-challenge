feature 'sign up' do
  scenario 'allows users to create an account' do
    visit '/'
    click_button 'Sign Up'
    expect(page).to have_content "Email"
    expect {click_button 'Submit'}.to change(User, :count).by(1)
  end
end
