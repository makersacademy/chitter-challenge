feature 'Peeps page' do
  scenario 'it shows a list of peeps in reverse chronological order' do
    allow(Time).to receive(:now).and_return('2019-01-01 00:00:00')
    Peep.create('My first peep!', '1')
    Peep.create('My second peep!', '1')
    visit '/'
    expect(page).to have_content("My second peep!sent by admin@chitter.com on 2019-01-01 00:00:00+00 My first peep!sent by admin@chitter.com on 2019-01-01 00:00:00+00")
  end
  scenario 'can post a new peep if logged in' do
    sign_in
    click_button 'Create peep'
    fill_in(:content, with: 'I am writing a peep')
    click_button 'Peep!'
    expect(page).to have_content('I am writing a peep')
  end
end
