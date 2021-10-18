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
    
    expect("peep 3").to appear_before("peep 2")
    expect("peep 2").to appear_before("peep 1")
  end

  Timecop.return
end
