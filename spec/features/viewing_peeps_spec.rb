feature 'Viewing peeps' do
  before do
    Timecop.freeze
    Peep.create(message: 'Hello world!')
  end

  scenario 'I can see existing peeps on the peeps page' do
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

  scenario 'I want to see the time at which it was made' do
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content(Time.now)
    end
  end
end
