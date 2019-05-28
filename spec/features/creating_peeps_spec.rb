feature 'homepage' do
  scenario 'allows user to write and submit their peep' do
    visit('/')
    expect(page).to have_field 'peep'
    expect(page).to have_button 'Wall it!'
    fill_in 'peep', with: "I love peeping! but now I'm hungry.."
    click_button 'Wall it!'
    expect(page).to have_content "I love peeping! but now I'm hungry.."
  end

  scenario 'sign-up button takes you to sign-up page' do
    visit('/')
    expect(page).to have_button 'Sign Up'
    click_button 'Sign Up'
    expect(page).to have_field 'email'
    expect(page).to have_field 'password'
    expect(page).to have_field 'name'
    expect(page).to have_field 'username'
    expect(page).to have_button 'Join'
  end
end
