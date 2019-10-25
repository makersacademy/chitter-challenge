feature 'Writing a new Peep' do
  scenario 'User can write and submit a new Peep' do
    # Visiting Index (where Peep.all outputs all current Peeps)
    visit('/')
    # Visiting get route /new_peep where user can input Peep as text and submit it
    visit('/new_peep')
    fill_in('peep', with: "I have just added a new Peep!")
    click_button('Add Peep')

    # When Add Peep is pressed, triggers post route to /adding_new_peep
    # where Peep string is added to peeps table using Peep.create
    expect(page).to have_content "I have just added a new Peep!"
  end
end
