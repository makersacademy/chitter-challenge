feature 'Viewing Peeps' do

  scenario 'I can see existing peeps on the peeps page' do

    Peep.create(message: 'Hello World', time_posted: Time.now)

    visit '/peeps'

    expect(page.status_code).to eq(200)
    expect(page).to have_content('Hello World')
  end
end
