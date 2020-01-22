feature 'Post a peep' do
  scenario 'Maker can post a peep to chitter' do
    visit('/chitter/new_peep')
    fill_in('peep', with: 'I love Makers')
    click_button('Create Peep')

    expect(page).to have_content "I love Makers"
  end
end
