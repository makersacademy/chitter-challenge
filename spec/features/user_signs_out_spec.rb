feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                name: 'Mr McTest',
                password: 'testy',
                password_confirmation: 'testy')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'testy')
    click_button 'Sign Out'
    expect(page).to have_content 'Goodbye'
    expect(page).not_to have_content 'Welcome, Mr McTest'
  end
end
