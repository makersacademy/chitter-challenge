feature 'page to create a peep and submit it' do
  scenario 'allows the user to submit their peep' do
    visit('/')
    expect(page).to have_field 'peep'
    expect(page).to have_button 'Submit Peep'
    fill_in 'peep', with: "I love peeping! but now I'm hungry.."
    click_button 'Submit Peep'
    expect(page).to have_content "I love peeping! but now I'm hungry.."
  end
end
