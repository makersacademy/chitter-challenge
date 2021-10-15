require 'pg'

# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps' do
  scenario 'see all peeps in Chitter' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (name,peep) VALUES ('Voldemort', 'I am a Pull Stack Developer. I pull things off the internet and put it in my code.');")
    connection.exec("INSERT INTO peeps (name,peep) VALUES('Gregorovitch', 'Debugging is like an onion. There are multiple layers to it, and the more you peel them back, the more likely you will cry.');")

    visit ('/chitter')
    expect(page).to have_content('I am a Pull Stack Developer. I pull things off the internet and put it in my code.')
    expect(page).to have_content('Debugging is like an onion. There are multiple layers to it, and the more you peel them back, the more likely you will cry.')
  end
end
