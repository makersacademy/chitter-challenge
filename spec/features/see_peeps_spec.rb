feature 'Viewing peeps' do
  scenario 'On the home page I can see a list of peeps' do
    Peep.create(content: 'Today I bought some cheese')
    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content 'Today I bought some cheese'
    end
  end
end
