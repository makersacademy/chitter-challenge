feature 'view all messages' do

  before(:each) do
    Message.create(name: 'person1', body: 'Why did the chicken?')
    Message.create(name: 'person2', body: 'Current news')
    Message.create(name: 'person3', body: 'Trolling')
  end

  scenario 'view messages on homepage' do
    visit '/homepage'
    expect(page.status_code).to eq(200)
    within 'ul#messages'
    expect(page).to have_content('Trolling')

  end

  scenario 'it posts a timestamp with message' do
    message = Message.create(name: 'person1', body: 'Why did the chicken?')
    visit '/homepage'
    within 'ul#messages'
    expect(page).to have_content(message.created_at)
  end
end
