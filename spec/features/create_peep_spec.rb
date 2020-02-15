feature 'creating peeps' do
  scenario 'a user can create a peep' do
    visit('/peeps/new')
    fill_in('content', with: 'The world is not enough')
    click_button('Submit')
    expect(page).to have_content("The world is not enough")
  end
end
