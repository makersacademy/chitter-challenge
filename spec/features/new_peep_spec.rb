feature 'New peep' do
  scenario 'User can enter a new message "peep' do
    visit('/')
    click_button 'Peep'
    fill_in :name, with 'Chloe'
    fill_in :username, with 'Chloeem'
    fill_in :new_peep, with 'Hello, world!'
    click_button 'Peep'

    expect(page).to have_content 'CHITTER'
    expect(page)to have_button 'Peep'
  end
end