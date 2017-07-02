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


feature 'sorted peeps' do
  scenario 'I can view the date I peeped' do
    Peep.create(body: 'My first peep!')
    visit('/chitter-home')
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Jul 02, 2017 ')
    end
  end
end
