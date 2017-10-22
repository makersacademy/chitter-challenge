feature 'Viewing Peeps' do

  scenario 'I can see existing peeps on the peeps page in the correct order' do
    visit '/peeps'


    click_button 'Add a new Peep'
    fill_in :message, with: 'Hello everyone'
    click_button 'submit'
    click_button 'Add a new Peep'
    fill_in :message, with: 'Hi guys'
    click_button 'submit'

    expect(page.find('li:nth-child(1)')).to have_content 'Hi guys'
    expect(page.find('li:nth-child(2)')).to have_content 'Hello everyone'

  end
end
