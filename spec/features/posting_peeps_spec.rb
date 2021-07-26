feature 'Posting a peep' do 

  scenario 'A user can post a peep(message) on Chitter' do
    visit('/chitter/add')
    fill_in('peep', with: 'This is my first peep')
    click_button('Submit')

    expect(page).to have_content('This is my peep')
  end
end