feature 'Sign up' do
  scenario 'a user signs up' do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Hey, Mali Michael.'
  end
  scenario 'user signs up with a blank email' do
    expect{sign_up(email: '')}.not_to change(User, :count)
  end
  scenario 'user signs up with invalid email' do
    expect{sign_up(email: 'mali')}.not_to change(User, :count)
  end
  scenario 'user signs up with an already in use email' do
    sign_up(email: 'mali@mali.com')
    expect{sign_up(email: 'mali@mali.com')}.not_to change(User, :count)
  end
end
