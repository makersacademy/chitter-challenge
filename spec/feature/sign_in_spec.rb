feature 'User signs in' do
  scenario 'Can find and click log in button on welcome page' do
    visit('/')
    find_button('Log In').click
  end

  scenario 'can log in' do
    visit('/')
    sign_up
    sign_in
    expect(current_path).to eq '/'
    expect(page).to have_content('Welcome, ' + User.first.email)
  end


  scenario 'can not log in with incorrect details' do
    visit('/')
    sign_up
    sign_in('a@a.com', 'wrongpasswordD:')
    expect(current_path).to eq '/welcome/'
    expect(page).to have_content('Incorrect log in details')
  end
end
