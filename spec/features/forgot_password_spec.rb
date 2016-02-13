feature 'Forgot Password' do
  scenario 'When click forgot Password, gets redirected to forgot password page' do
    visit('/')
    click_link('Forgot Password?')
    expect(current_path).to eq '/users/forgot-password'
    expect(page).to have_content 'Password Reset Form'
  end
end
