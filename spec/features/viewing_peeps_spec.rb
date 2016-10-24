feature 'Viewing peeps.' do

  scenario 'I can see existing peeps on the peeps page' do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Peep.create(user_name: 'Jeff', user_peep: 'This is my first peep!')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep!')
    end
  end
end
