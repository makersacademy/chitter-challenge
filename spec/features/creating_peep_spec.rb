# require 'pg'

# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Creating a new peep' do
  scenario 'Posting a peep to chitter' do
    visit ('/chitter')
    # fill_in('name', with: "Voldemort")
    # fill_in('peep', with: "I'm a Pull Stack Developer. I pull things off the internet and put it in my code.")
    # click_button('Submit')

    expect(page).to have_content("I'm a Pull Stack Developer. I pull things off the internet and put it in my code.")
  end
end
