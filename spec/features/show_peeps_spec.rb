require_relative 'web_helpers.rb'

feature "Index page" do
  before(:each) do
    prepare_databases
    visit('/')
  end
  scenario "handle of user is shown" do
    expect(page).to have_content("@Canary")
  end
  scenario "name of user is shown" do
    expect(page).to have_content("Mr Canary")
  end
  scenario "date of peep is shown" do
    expect(page).to have_content("20 Nov 2018")
  end
  scenario "time of peep is shown" do
    expect(page).to have_content("9:00")
  end
  scenario "content of peep is shown" do
    expect(page).to have_content("this is a test")
  end

  scenario "peeps are shown in reverse chronological order" do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT into peeps VALUES ( 2, 1, 'test number 2', '2018-11-20 9:15:00',NULL)")
    visit ('/')
    expect(page).to have_content(/09:15.+\n.+\n.+09:00/)
  end

end
