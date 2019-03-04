
feature 'Adding new peep' do
  scenario 'user can post peep to chitter' do
    visit('/peeps/new')
    fill_in('pmessage', with: 'What is the plan?')
    click_button('Post')
    expect(page).to have_content 'What is the plan?'
  end
end
