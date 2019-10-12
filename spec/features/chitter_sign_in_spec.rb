feature 'user sign in options' do
  scenario 'the user log in with correct email and password' do
    User.create('test@test.com', 'password', 'John Doe', 'J')
    visit('/')
    click_button('Sign in')
    expect(current_path).to eq '/users/user'
    sign_in_correct
    expect(page).to have_content 'Insert the message:'
  end

  scenario 'the user try to log in with incorrect email or password' do
    User.create('test@test.com', 'password', 'John Doe', 'J')
    visit('/')
    click_button('Sign in')
    expect(current_path).to eq '/users/user'
    sign_in_incorrect
    expect(page).to have_content 'email or username incorrect'
  end
end
