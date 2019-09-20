feature 'homepage' do
  scenario 'allows user to write and submit their peep' do
    visit('/')
    expect(page).to have_field 'peep'
    expect(page).to have_button 'wall it!'
    fill_in 'peep', with: "I love peeping! but now I'm hungry.."
    click_button 'wall it!'
    expect(page).to have_content "I love peeping! but now I'm hungry.."
  end

  scenario 'sign-up button takes you to sign-up page' do
    visit('/')
    expect(page).to have_button 'sign up'
    click_button 'sign up'
    expect(page).to have_field 'email'
    expect(page).to have_field 'password'
    expect(page).to have_field 'name'
    expect(page).to have_field 'username'
    expect(page).to have_button 'join'
  end
end
