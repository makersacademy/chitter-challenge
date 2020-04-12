feature 'User can make add a peep' do
  scenario 'visits webpage and makes peep' do
    visit('/')
    fill_in('peep', with: '1st peep')
    click_button('Peep')

    expect(page).to have_content '1st peep'
  end
end

feature 'User can see peeps in reverse chronological order' do
  scenario 'visits webpage, adds multiple peeps' do
    visit('/')
    fill_in('peep', with: '1st peep')
    click_button('Peep')
    fill_in('peep', with: '2nd peep')
    click_button('Peep')
    fill_in('peep', with: '3rd peep')
    click_button('Peep')

    expect(page).to have_content('3rd peep 2nd peep 1st peep')
  end
end
