feature 'Sign up' do
  scenario 'Maker wants to make a Chitter account' do
    signup
    expect(page).to have_content 'Signup!'
  end
end
