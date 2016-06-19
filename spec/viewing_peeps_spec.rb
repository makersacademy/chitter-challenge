feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(message: 'test peep', user: 'shogun')

    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('test peep')
    end
  end
end