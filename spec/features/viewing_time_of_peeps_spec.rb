feature 'Time of peep' do
  scenario 'viewing the time of a peep' do
    visit('/')
    fill_in :peep, with: 'Watching TV'
    time = Time.now
    click_button('Peep')
    expect(page).to have_content 'Watching TV'
    expect(page).to have_content(time)
  end
end
