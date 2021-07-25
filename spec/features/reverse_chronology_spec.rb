feature 'Reverse chronology' do
  scenario 'Most recent peeps are at the top' do
    visit('/peeps')
    click_button('Post a Peep')
    fill_in('peep', with: 'This is my first peep')
    click_button('Submit Peep')
    click_button('Post a Peep')
    fill_in('peep', with: 'This is my second peep')
    click_button('Submit Peep')

    expect(page.find('li:nth-child(1)')).to have_content 'This is my second peep'
    expect(page.find('li:nth-child(2)')).to have_content 'This is my first peep'
  end
end
