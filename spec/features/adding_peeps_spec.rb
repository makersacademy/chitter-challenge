feature 'Adding peeps' do

  scenario 'peep button exists' do
    visit('/')
    expect(page).to have_button 'Peep!'
  end

  scenario 'homepage updates with users peep' do
    visit('/')
    fill_in('new_peep', with: 'Example peep')
    click_button('Peep!')
    expect(page).to have_content 'Example peep'
    expect(page).to have_content "#{Time.now.strftime("%F %T")}"
  end

end
