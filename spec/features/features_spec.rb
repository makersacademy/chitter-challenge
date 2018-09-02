Capybara.app = ChitterChallenge

feature 'Viewing peeps' do
  scenario 'user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "hello world!"
  end
end
