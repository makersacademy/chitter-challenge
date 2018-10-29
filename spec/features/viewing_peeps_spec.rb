require 'pg'

feature 'Feature - Viewing Peeps' do
  before(:each) do
    @user = User.create(first_name: 'Test',
      last_name: 'McTest',
      username: 'Testarannosaurus',
      email: 'test@example.com',
      password: 'password123')
  end

  scenario 'A user can see Peeps' do
    Peep.new_peep(message: "This is a peep", user_id: @user.id)
    Peep.new_peep(message: "This is another peep", user_id: @user.id)
    Peep.new_peep(message: "This is a third peep", user_id: @user.id)

    visit('/')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "This is another peep"
    expect(page).to have_content "This is a third peep"
  end

  scenario 'Peeps have data/time stamp' do
    peep = Peep.new_peep(message: "This is a peep with time", user_id: @user.id)
    visit('/')

    peep_time = find_by_id("#{peep.id}-peep-time")

    expect(peep_time).to have_text peep.formatted_peep_time
  end

  scenario 'Peeps show the username of the user that posted them' do

    @user_two = User.create(first_name: 'Testy',
      last_name: 'McTest',
      username: 'Testy',
      email: 'test@gmail.com',
      password: 'password123')

    second_peep = Peep.new_peep(message: "This is a peep by a second user and it should show THEIR username", user_id: @user_two.id)

    peep = Peep.new_peep(message: "This is a peep and it should show the username", user_id: @user.id)

    visit('/')
    user_one_name = find_by_id("#{peep.id}-username")
    user_two_name = find_by_id("#{second_peep.id}-username")

    expect(user_one_name).to have_text 'Testarannosaurus'
    expect(user_two_name).to have_text 'Testy'
  end

end
