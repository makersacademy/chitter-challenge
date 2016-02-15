require 'time'

feature 'Showing the list of all peeps' do

  before(:each) do

    user = User.create(email: 'alice@example.com',
                password: 'aliali',
                username: 'useruser',
                name: 'alice')
    Peep.create(text: 'I am a peep',
                date: Time.parse('2016-02-14 09:00:00'),
                user: user)
  end

  scenario 'I can see the list of all peeps if I am not logged in' do
    visit '/'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('I am a peep')
  end

end