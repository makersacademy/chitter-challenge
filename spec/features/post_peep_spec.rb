
  feature 'Visit chitter' do
    scenario 'a user visits chitter' do
      visit '/'
      expect(page).to have_content("Welcome to Chitter!")
    end
  end

  feature 'Viewing peeps' do
  scenario 'see a list of all peeps' do
    visit('/peeps')
    fill_in('peep', :with => 'First peep')
    peeps = Chitter.new

    expect(page).to have_content "First peep"
    expect(page).to have_content "Second peep"
    expect(page).to have_content "Third peep"
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'Viewing peeps in reverse chronological order' do
    visit('/peeps')
    peeps = Chitter.new

    expect(page).to have_content('Third peep')
    expect(page).to have_content('Second peep')
    expect(page).to have_content('First peep')
  end
end
