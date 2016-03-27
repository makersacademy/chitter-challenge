feature 'User given options at start page' do
  before(:each) do
    visit '/'
  end

  scenario 'signing up, logging in or guest' do
    click_button('Sign up')
    expect(current_path).to eq('/users/new')
  end

  scenario 'log in' do
    click_button('Sign in')
    expect(current_path).to eq('/sessions/new')
  end

  scenario 'view tweets as a guest' do
    click_button('Continue as guest')
    expect(current_path).to eq('/home')
  end
end
