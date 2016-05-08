feature 'Viewing peeps' do

  scenario 'I can see existing links on the links page' do
    Peep.create(content: 'http://www.makersacademy.com', created_at: Time.now)

    visit '/peeps'

    # as this is our first feature test,
    # the following expectation is a quick check that everything is working.
    expect(page.status_code).to eq 200
    # you might remove this later.

    # why do we use within here?
    # might we get a false positive if we just test for 'Makers Academy'?
      expect(page).to have_content('http://www.makersacademy.com')
  end
end
