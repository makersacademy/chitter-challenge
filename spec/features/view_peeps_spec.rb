feature 'View all peeps' do

  scenario "Can view a list of all peeps" do

    Peep.create(user_name: 'zombie9', time_stamp: 'NOW()', text: 'blah, blah, blah') 

    visit '/peeps'

    expect(page).to have_content('blah, blah, blah')

  end

end
