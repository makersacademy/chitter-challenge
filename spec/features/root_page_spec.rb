feature 'set up' do
  scenario 'visit page' do
    visit '/'
    click_on 'Login'
    expect(page).to have_content "Welcome to Twittarr."
  end
end