feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/')
    fill_in('peep', with: 'How do you download twitter')
    click_button('Submit')
    expect(page).to have_content 'How do you download twitter'
  end
end
