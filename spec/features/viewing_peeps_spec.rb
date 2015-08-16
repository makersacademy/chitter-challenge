feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do

    Peep.create(user: 'test_user', content: 'my first peep')
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('test_user my first peep')
    end
  end
end
