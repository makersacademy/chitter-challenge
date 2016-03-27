feature 'Sign up' do
  scenario '> user count should increase and a personalised welcome message shown' do
    expect{sign_up_correctly}.to change{User.count}.by 1
    expect(page).to have_content 'Welcome Marty!'
  end
end
