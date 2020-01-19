feature 'add peep' do
  scenario 'user adds a peep' do
    visit '/'
    fill_in :current_username, with: 'John'
    click_on 'Register'
    fill_in :current_username, with: 'John'
    click_on 'Login'
    fill_in :message, with: 'Hello world'
    click_on 'Send peep'
    expect(page).to have_content 'Hello world'
  end
end