feature 'Viewing peeps' do

  scenario 'I can see peeps on the home page' do
    Peep.create(text: 'testing')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page.to have_content('testing'))
    end
  end
end
