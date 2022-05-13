feature "Adding a new peep" do
  scenario 'A user can add a new peep to Chitter' do
    visit('/peep')
    fill_in('peep_text', with: 'Every application somehow needs PosgreSQL')
    click_button 'Submit'

    visit('/peep')

    expect(page).to have_content 'Every application somehow needs PosgreSQL'
  end
end
