feature 'Viewing peeps' do
  scenario 'user can see all peeps' do
    Peep.create(content: 'Hello World', time: '2006-01-01 00:00:01')
    Peep.create(content: 'Sunny today', time: '2007-05-06 13:30:30')

    visit('/')
    
    expect(page).to have_content 'Hello World'
    expect(page).to have_content 'Sunny today'
  end
end

