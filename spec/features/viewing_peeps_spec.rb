feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(content: 'Makers Academy is a coding bootcamp')

    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
