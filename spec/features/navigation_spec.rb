feature 'FEATURE: user can navigate using buttons' do
  scenario 'from welcome page to peeps page' do
    sign_up
    click_button 'View peeps'
    expect(current_path).to eq '/peeps'
  end

  scenario 'from welcome page to create peeps page' do
    sign_up
    click_button 'Peep!'
    expect(current_path).to eq '/peeps/new'
  end

  scenario '/index displays options to sign up and sign in if not logged in' do
    visit '/peeps'
    expect(page).to have_content 'New to Chitter? Sign up here:'
    expect(page).to have_content 'Have an account? Sign in to peep:'
    expect(page).not_to have_content 'Click here to make a peep:'
  end
end
