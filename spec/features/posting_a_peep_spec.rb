feature 'Posting a peep' do

  scenario 'I can post the peeps I want on my website' do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Peep.create(message: 'Hello my name is Alex', name: 'Alex')

    visit '/peeps'

    # this is a *temporary* sanity check - to make sure we
    # can load the page :)
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Hello my name is Alex')
    end
  end
end
