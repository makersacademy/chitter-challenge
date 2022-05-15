require 'pg'

feature 'viewing chitter' do
  scenario 'Visiting /messages show me all the peeps' do
    time = Time.new(2022, 05, 15, 10, 30, 15)
    time_test = time.strftime('%Y-%m-%d %H:%M:%S')
    allow(Time).to receive(:now).and_return(time_test)

    Chitter.create(peep: 'I love Chitter!')
    Chitter.create(peep: 'How do I peep?')
    Chitter.create(peep: 'This is so fun.')
    
    visit('/messages')

    expect(page).to have_content "This is so fun."
    expect(page).to have_content "How do I peep?"
    expect(page).to have_content "I love Chitter!"
    expect(page).to have_content '2022-05-15 10:30:15'
    
  end

end
