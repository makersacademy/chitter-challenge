feature 'Peeps page' do
  scenario 'it shows a list of peeps in reverse chronological order' do
    allow(Time).to receive(:now).and_return('2019-01-01 00:00:00')
    Peep.create('My first peep!', '1')
    Peep.create('My second peep!', '1')
    sign_in
    expect(page).to have_content("My second peep!\nsent by admin@chitter.com on 2019-01-01 00:00:00+00\nMy first peep!\nsent by admin@chitter.com on 2019-01-01 00:00:00+00")
  end
  scenario 'can post a new peep if logged in' do
    sign_in
    click_button 'Create peep'
    fill_in(:content, with: 'I am writing a peep')
    click_button 'Peep!'
    expect(page).to have_content('I am writing a peep')
  end
  scenario 'it can show peeps by a specific user' do
    allow(Time).to receive(:now).and_return('2019-01-01 00:00:00')
    User.create('me@example.com', 'password1234')
    Peep.create('My first peep!', '1')
    Peep.create('I write the best peeps.', '2')
    Peep.create('Here is another one.', '2')
    sign_in
    first(:link, 'me@example.com').click
    expect(page).to have_content("Here is another one.sent by me@example.com on 2019-01-01 00:00:00+00 I write the best peeps.sent by me@example.com on 2019-01-01 00:00:00+00")
  end
end
