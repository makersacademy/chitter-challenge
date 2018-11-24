feature 'Viewing the homepage' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    find('input[type="text"][name*="peep_content"]')
    expect(page).to have_button('Make A Peep')
  end

  scenario 'A user can see peeps on the homepage' do
    visit('/')
    fill_in 'peep_content', with: 'Is anyone there?'
    click_button 'Make A Peep'
    fill_in 'peep_content', with: 'Hi, everyone'
    click_button 'Make A Peep'
    expect(page).to have_content 'Is anyone there?'
    expect(page).to have_content 'Hi, everyone'
  end
end
