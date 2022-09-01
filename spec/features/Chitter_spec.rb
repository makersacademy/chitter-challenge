
RSpec.feature "home_page", type: :feature do
  scenario "home page should have a welcome message displayed on it" do
    visit '/'

    expect(page).to have_content("Welcome to Chitter")
  end

  scenario "home page should have a sign up page that takes the users information and takes them back to the home page" do
    visit '/'
    click_on 'sign up'
    fill_in 'Name', with: "James"
    fill_in 'Username', with: 'JamesMay123'
    fill_in 'Password', with: 'Topgear123'
    click_on 'create account'

    expect(current_path).to eq('/')
  end

  scenario "home page should have a button thst takes you to a login portal that allows users to sign in" do
    visit '/'

    click_on 'login'

    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    expect(page).to have_button('Login')
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
