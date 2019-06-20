
  feature 'Visit chitter' do
    scenario 'a user visits chitter' do
      visit '/'
      expect(page).to have_content("Welcome to Chitter!")
    end
  end

  feature 'Viewing peeps' do
  scenario 'see a list of all peeps' do
    visit('/peeps')
    peeps = Chitter.new

    expect(page).to have_content "First peep"
    expect(page).to have_content "Second peep"
    expect(page).to have_content "Third peep"
  end
end
