feature 'Viewing peeps:' do
  scenario 'I can see a list of peeps on the home page' do
    Peep.create(message: 'Little Bo Peep has lost her sheep')
    visit '/'
    within 'div#peeps' do
      expect(page).to have_content('Little Bo Peep has lost her sheep')
    end
  end
end
