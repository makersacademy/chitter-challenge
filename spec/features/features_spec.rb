Capybara.app = ChitterChallenge

feature 'Viewing peeps' do
  scenario 'user can see pre-added peeps' do
    visit('/peeps')
    expect(page).to have_content "hello world!"
  end
end
