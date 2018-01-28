feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(message: 'Hello world!')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Hello world!')
    end
  end

  scenario 'I want to see all peeps in reverse chronological order' do
    Peep.create(message: 'Hello world!')
    Peep.create(message: 'Hello world again!')
    visit '/peeps'
    within 'ul#peeps' do
      expect('Hello world again!').to appear_before('Hello world!')
    end
  end
end
