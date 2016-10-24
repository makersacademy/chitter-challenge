feature 'Viewing Peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    sign_up
    sign_in(email: 'test@tester.com', password: 'testpassword')
    click_button "Add a new peep"
    fill_in 'Message', with: "Hi all my peeps!!!"
    click_button "Peep this!"
    visit '/peeps'
    expect(page).to have_content('Hi all my peeps!!!')
  end
end
