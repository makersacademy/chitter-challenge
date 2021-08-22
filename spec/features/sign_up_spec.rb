feature 'visiting the sign up page' do
  scenario 'see the page heading' do
    visit '/sign-up'
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario 'can fill in sign up details and get welcome message' do
    sign_up
    expect(page).to have_current_path('/new-user')
    expect(page).to have_content 'Thank you for signing up to Chitter!'
  end

  scenario 'rejects sign ups that use existing email address' do
    sign_up
    sign_up_with_existing_email
    expect(page).not_to have_content 'Thank you for signing up to Chitter!'
    expect(page).to have_content 'Sorry, that email is already associated with an account'
    expect(page).to have_button 'Try Again'
    expect(page).to have_button 'Homepage'
  end

  scenario 'rejects sign ups that use existing handles' do
    sign_up
    sign_up_with_existing_handle
    expect(page).not_to have_content 'Thank you for signing up to Chitter!'
    expect(page).to have_content 'Sorry, that handle is already associated with an account'
    expect(page).to have_button 'Try Again'
    expect(page).to have_button 'Homepage'
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
