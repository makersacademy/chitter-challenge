feature 'view all peeps' do
  scenario 'user is able to see all peeps and their timestamps' do
    peep_one = Peep.add(post: 'this is a test message')
    peep_two = Peep.add(post: 'this is another test message')

    visit '/'
    click_button 'See latest Peeps!'

    expect(page).to have_content "#{peep_one.timestamp} - this is a test message"
    expect(page).to have_content "#{peep_two.timestamp} - this is another test message"
  end
end
