feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    sign_up
    sign_in(username: 'user100', password: 'Password123')
    fill_in :message, with: "My first message"
    click_button 'Add'
    expect(page).to have_content('My first message')
    end
end
