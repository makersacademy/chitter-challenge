feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(name: 'Jack Bauer', user_name: 'Jack24')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Jack Bauer')
      expect(page).to have_content('Jack24')
    end
  end
end
