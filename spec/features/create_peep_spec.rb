feature 'Create peep' do
  scenario 'can display peep creation form' do
    visit('/create_peep')
    expect(page).to have_field('user_name', type: 'text')
    expect(page).to have_field('content', type: 'text')
    expect(page).to have_button('submit')
  end
  scenario 'can display new peep' do
    visit('/create_peep')
    fill_in 'user_name', with: 'Twitter'
    fill_in 'content', with: 'Lawsuit!!'
    click_button('submit')
    expect(page).to have_content 'Twitter'
    expect(page).to have_content 'Lawsuit!!'
  end
end
