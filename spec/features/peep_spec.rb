feature 'posting a peep' do
  scenario 'the peep appears on the page with the time it was added' do
    allow(Time).to receive(:now).and_return(Time.parse('2017-11-18 13:57:25 +0000'))
    visit '/peeps'
    fill_in('peep', with: 'Hi there!')
    click_button('Peep!')
    expect(page).to have_content('Hi there! 2017-11-18 13:57:25 +0000')
  end

  scenario 'the peep is added to the database' do
    visit '/peeps'
    fill_in('peep', with: 'Hi there!')
    click_button('Peep!')
    expect(Peep.all.length).to eq 1
  end

  scenario 'peeps show up in reverse order' do
    visit '/peeps'
    fill_in('peep', with: 'Hi there!')
    click_button('Peep!')
    fill_in('peep', with: 'Hello!')
    click_button('Peep!')
    expect(page).to have_selector("ul li:nth-child(1)", text: 'Hello!')
    expect(page).to have_selector("ul li:nth-child(2)", text: 'Hi there!')
  end
end
