feature 'Show all peeps' do
  scenario 'I can see all peeps when logged in' do
    sign_up

    post(peep: "my new peep")
    post(peep: "my other peep")
    post(peep: "even another peep")

    expect(page).to have_content("my new peep")
    expect(page).to have_content("my other peep")
    expect(page).to have_content("even another peep")
  end

  scenario 'I can see all peeps when logged out' do
    sign_up

    post(peep: "my new peep")
    post(peep: "my other peep")
    post(peep: "even another peep")

    visit('/log_out')

    expect(page).to have_content("my new peep")
    expect(page).to have_content("my other peep")
    expect(page).to have_content("even another peep")
  end

end
