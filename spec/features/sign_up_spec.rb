feature 'visiting the sign up page' do
  scenario 'see the page heading' do
    visit '/sign-up'
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario 'can fill in sign up details and get welcome message' do
    sign_up
    expect(page).to have_current_path('/welcome')
    expect(page).to have_content 'Thank you for signing up to Chitter!'
  end
end

feature 'visiting the welcome page' do
  scenario 'can return to homepage' do
    sign_up
    click_button 'Homepage'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Ed is logged in!')
  end
end
