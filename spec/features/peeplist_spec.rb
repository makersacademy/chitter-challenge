feature 'peeplist' do
  scenario 'displays peeplist' do
    visit('/')
    fill_in 'peep', with: 'Breakfast'
    click_button('Peep')
    visit('/peeplist')
    expect(page).to have_content 'Breakfast'
  end
end
