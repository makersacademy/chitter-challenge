
feature 'Welcome page' do
  scenario 'Two option buttons' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end

feature 'Adding a new peep' do
  scenario 'A user can add a new peep to Peep db' do
    visit('/create_peep')
    fill_in('peep', with: 'Test peep')
    click_button('Peep peep')
    expect(page).to have_content('Test peep')
  end
end

  feature 'Viewing peeps' do
    scenario 'peeps are visible' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      @time = Time.now
      connection.exec("INSERT INTO peeps (id, peep, time_stamp) VALUES(1, 'This is my first peep!', '#{@time}');")
      connection.exec("INSERT INTO peeps (id, peep, time_stamp) VALUES(2, 'This is my second peep!','#{@time}');")
      connection.exec("INSERT INTO peeps (id, peep, time_stamp) VALUES(3, 'This is my third peep!','#{@time}');")

      visit '/view_peeps'

      expect(page).to have_content 'This is my first peep!'
      expect(page).to have_content 'This is my second peep!'
      expect(page).to have_content 'This is my third peep!'
    end
  end