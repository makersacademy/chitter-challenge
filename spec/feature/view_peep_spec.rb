feature 'viewing peeps' do
  scenario 'I can view my peep on Chitter' do
    Peep.create(body: 'My first peep!')
    visit('/chitter-home')
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('My first peep!')
    end
  end
end
