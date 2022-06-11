def truncate_table
  controller = PG.connect :dbname => 'chitter_test'
  controller.exec ("TRUNCATE TABLE peeps")
end

def add_two_peeps
  visit '/chitter'
      click_on 'Compose a peep'
      fill_in 'peep', with: "What's peeping with YOU!?"
      click_on 'Share'
      click_on 'Compose a peep'
      fill_in 'peep', with: "I'm loving to peep"
      click_on 'Share'
end