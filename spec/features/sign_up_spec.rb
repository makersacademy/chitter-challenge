feature 'test sign up page' do
  scenario 'check sign up button is working' do 
    visit('/home')
    click_on('Sign up')
    expect(page).to have_content 'Enter username'
  end 
end