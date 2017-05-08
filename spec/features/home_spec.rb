feature 'Home' do

  before(:each) do
    visit '/'
  end

  scenario 'Displays App instructions' do
    expect(page).to have_content 'Sign up or Log in to start posting your peeps!'
  end

  scenario 'Has a Sign Up button' do
    expect(page).to have_button 'Sign Up'
  end

  scenario 'Has a Log In button' do
    expect(page).to have_button 'Log In'
  end

end
