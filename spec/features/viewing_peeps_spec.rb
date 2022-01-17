feature 'viewing peeps' do
  scenario 'seee peeps in homepage' do
    visit('/')
    expect(page).to have_content 'Hello chitter users'
    expect(page).to have_content 'This is my first peep'
  end
end