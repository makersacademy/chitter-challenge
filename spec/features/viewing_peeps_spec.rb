feature 'Viewing peeps' do
  scenario 'peeps are shown on the home page' do
    Peep.post('This is a test peep!')
    visit '/'
    expect(page).to have_content 'This is a test peep!'
  end

  scenario 'peeps are shown in reverse chronological order' do
    Peep.post('This is a test peep!')
    Peep.post('This is also a test peep!')
    visit '/'
    expect(page.find('.peep:nth-of-type(1)')).to have_content 'This is also a test peep!'
  end
end
