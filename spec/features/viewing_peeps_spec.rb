feature 'Viewing peeps' do
  scenario 'A user can see the peeps' do
    Peep.create(message: 'message one', user_name: 'user1')
    Peep.create(message: 'message two', user_name: 'user1')
    Peep.create(message: 'message three', user_name: 'user1')

    visit('/peeps')

    expect(page).to have_content "message one"
    expect(page).to have_content "message two"
    expect(page).to have_content "message three"
  end
end
