feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the main page' do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Link.create(peep: 'Here is my opinion on something')

    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Here is my opinion on something')
    end
  end
end
