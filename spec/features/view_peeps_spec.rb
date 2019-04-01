require 'pg'

feature 'Viewing peeps' do
  scenario 'User goes to Chitter main page to view peeps' do

    connection = PG.connect(dbname: 'chitter_app_test')

    pusheen = User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')
    gudetama = User.create(fullname: 'Gudetama', username: '@gudetama', email: 'gudetama@test.com', password: 'gudetama-password')
    yoda = User.create(fullname: 'Yoda', username: '@yoda', email: 'yoda@test.com', password: 'yoda-password')

    # Add the test data
    Peep.create(message: "Peep 1 by Pusheen", user: pusheen.id, username: '@pusheen')
    Peep.create(message: "Peep 2 by Gudetama", user: gudetama.id, username: '@gudetama')
    Peep.create(message: "Peep 3 by Yoda", user: yoda.id, username: '@yoda')

    visit('/peeps')

    expect(page).to have_content "Peep 1 by Pusheen"
    expect(page).to have_content "Peep 2 by Gudetama"
    expect(page).to have_content "Peep 3 by Yoda"
  end
end
