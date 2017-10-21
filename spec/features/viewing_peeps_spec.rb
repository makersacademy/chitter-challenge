feature 'viewing peeps' do

  text = 'Consequat ea in voluptate magna est veniam non laboris pariatur reprehenderit culpa consectetur.'
  posted_time = DateTime.now
  let(:user) { User.create(name: 'Ainsley', email: 'no@email.com', password: 'password', handle: '#ainsley') }

  scenario 'user sees all messages in reverse chronological order' do
    Peep.create(text: 'added first', posted_on: posted_time, user: user)
    Peep.create(text: 'added second', posted_on: posted_time, user: user)
    Peep.create(text: 'added third', posted_on: posted_time, user: user)
    visit '/peeps'
    expect(page.find('div:first-child')).to have_content 'added third'
    expect(page.find('div:last-child')).to have_content 'added first'
  end

  scenario 'peep shows the time it was posted' do
    Peep.create(text: text, posted_on: posted_time, user: user)
    visit '/peeps'
    within 'li:first-child'
    expect(page).to have_content posted_time.strftime("%d/%m/%Y %H:%M")
  end

end