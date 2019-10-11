feature 'Sign up' do
  scenario 'User can sign up' do
    visit('/')
    click_button('Sign Up')
    expect(current_path).to eq "/users/new"
    fill_in('username', with: "user001")
    fill_in('password', with: "password")
    click_button('Sign Up')
    expect(current_path).to eq '/peeps'
  end
end
