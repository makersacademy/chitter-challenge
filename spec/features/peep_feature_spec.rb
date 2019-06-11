feature '#all' do
  scenario 'user can view all post ' do

    connection = PG.connect(dbname: 'chitter_challenge_test')
    #add test data
    connection.exec("INSERT INTO peeps_table (peep) VALUES ('My first peep');")

    visit('/welcome')
    expect(page).to have_content("My first peep")
  end
end

feature '#post' do
  scenario 'user can post peeps' do
    visit('/welcome')
    fill_in('message', with:'This is amazing')
    click_button('submit')

    expect(page).to have_content("This is amazing",Time.now)
  end
end
