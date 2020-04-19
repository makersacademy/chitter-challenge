feature 'sign up' do
  scenario 'user is redirected to the registration page' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/register'
  end
end
