feature 'viewing peeps' do

  scenario 'user sees all messages in reverse chronological order' do
    Peep.create(text: 'added first')
    Peep.create(text: 'added second')
    Peep.create(text: 'added third')
    visit '/peeps'
    expect(page.find('li:first-child')).to have_content 'added third'
    expect(page.find('li:last-child')).to have_content 'added first'
  end

end