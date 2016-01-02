feature 'viewing peeps' do
  scenario 'I can see existing peeps' do
    Peep.create(content: 'My first peep!')

    visit('/peeps/index')
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('My first peep!')
    end
  end
end
