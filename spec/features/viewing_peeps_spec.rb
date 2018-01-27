feature 'Viewing peeps' do

  scenario 'The user can see a list of peeps on the peeps page' do
    Peep.create(message: "Peep peep")
    visit '/peep/all'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Peep peep")
  end

end
