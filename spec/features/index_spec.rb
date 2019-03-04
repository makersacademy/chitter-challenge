feature 'Welcome page' do
  scenario 'user arrives at site and sees welcome message' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature 'Allows user to sign up' do
  scenario 'user can click a link to sign up' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_current_path '/sign_up?Sign+up='
  end
end

feature 'Allows user to see peeps' do
  scenario 'user can click a link to see peeps without signing up' do
    visit '/'
    click_button 'See peeps'
    expect(page).to have_current_path '/peeps?showpeeps='
  end
end
