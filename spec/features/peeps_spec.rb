feature 'Peeps' do
  scenario 'be able to send peeps' do
    register
    sign_in
    peep
    expect(page).to have_content("Hello world")
  end

  scenario 'be able to send multiple peeps and are sorted chronologically' do
    register
    sign_in
    peep
    sleep 2
    peep2
    expect(page).to have_content('Hello world')
    expect(page).to have_content('Does this work?')
    expect(page.body).to have_content(/Does this work.*Hello world./)
  end

  scenario 'must be logged in to peep' do
    peep
    expect(page).to have_content("Please log in to peep")
    expect(current_path).to eq '/peeps/new'
  end
end