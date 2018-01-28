feature 'Display the peeps' do
  scenario 'see a peep' do
    visit('/peeps/new_peep')
    fill_in 'peeps', with: 'Hello great day!'
    click_button 'Send'
    maker = Maker.first
    expect(page).to have_content('Hello great day!')
  end

  scenario 'write two peeps in the same post' do
    visit('/peeps/new_peep')
    fill_in 'peeps', with: 'Hello great day!  I hope you are amazing!'
    click_button 'Send'
    maker = Maker.first
    expect(page).to have_content('Hello great day!', 'I hope you are amazing!')
  end
end
