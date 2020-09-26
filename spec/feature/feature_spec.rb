feature 'the site has a homepage' do
  scenario 'the user visits the homepage' do
    visit('/')
    expect(page).to have_content("chitter")
  end
end

feature 'users can peep' do
  scenario "the site's homepage has a form that asks people to peep" do
    visit('/')
    expect(page).to have_content("new peep")
  end
end

feature 'users can sign up' do
  scenario 'a user signs up' do
    visit('/')
    click_on('sign up')
    fill_in('name', with: 'Bingo Boingo')
    fill_in('email', with: 'test_email@email.com')
    fill_in('password', with: 'testpassword123')
    fill_in('username', with: 'bingo01')
    click_on('sign up')
    expect(page).to have_content('thanks for signing up to chitter')
  end
end
