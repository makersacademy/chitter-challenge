
RSpec.feature "home_page", type: :feature do
  scenario "home page should have a welcome message displayed on it" do
    visit '/'

    expect(page).to have_content("Welcome to Chitter")
  end

  scenario "User fills in the form with a peep and can then view all his peeps" do
    visit '/'
    fill_in 'peep_content', with: 'The Batman movie was really great'
    click_on 'Peep'

    expect(page).to have_content("The Batman movie was really great")
  end

  scenario "the time for each peep should be shown when a new peep is created" do
    allow(Time).to receive(:now).and_return('15:13:25')

    visit '/'
    fill_in 'peep_content', with: 'The Batman movie was really great'
    click_on 'Peep'

    expect(page).to have_content('15:13:25')
  end
end
