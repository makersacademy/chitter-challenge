require 'timecop'

feature 'Viewing peeps' do
  scenario 'A user can see a list of all peeps in reverse chronological order with their author' do 

    [2019,2020,2021].each_with_index do |year, index|
      user = User.create(
        first_name: 'Test', last_name: 'User', username: "user#{index + 1}",
        email: "user#{index + 1}@test.com", password: '12345'
      )
      Timecop.freeze(Time.utc(year))
      Peep.create(text: "peep #{index + 1}", author: user.id)
    end

    visit('/')

    expect(page).to have_content(
      "peep 3 user3 00:00 am · 01 Jan 2021 "\
      "peep 2 user2 00:00 am · 01 Jan 2020 "\
      "peep 1 user1 00:00 am · 01 Jan 2019"
    ) # they are in a html list (and shown as one) but expect_content views them as a single line
  end

  Timecop.return
end
