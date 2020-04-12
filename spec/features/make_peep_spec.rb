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

    expect(page).to have_content '3rd peep'
    expect(page).to have_content '2nd peep'
    expect(page).to have_content '1st peep'
  end
end

feature 'User can see the time a and date a peep was made' do
  scenario 'adds new peep and can see time' do
    visit('/')
    fill_in('peep', with: 'timed peep')
    click_button('Peep')
    time = Time.now.strftime('%Y-%m-%d %k:%M:%S')
    expect(page).to have_content("timed peep - #{time}")
  end
end
