feature 'Writing a new Peep' do
  scenario 'User can write and submit a new Peep' do
    visit('/')
    visit('/new_peep')
    fill_in('peep', with: "I've just added a new Peep!")
    click_button('Add Peep')

    expect(page).to have_content "I've just added a new Peep!"
  end
end
