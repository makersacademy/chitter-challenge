feature 'creating a peep' do
  scenario 'user is prompted to create a new peep' do
    visit_root_and_sign_in

    expect(page).to have_content 'new peep'
  end

  scenario 'can create a new peep' do
    visit_root_and_sign_in
    fill_in 'peep-body', with: 'Goodnight Moon'
    click_button 'post'

    expect(page).to have_content 'Goodnight Moon'
  end
end
