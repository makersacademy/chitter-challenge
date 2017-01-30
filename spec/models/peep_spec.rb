feature 'Viewing peeps' do

  scenario 'I can create a peep and view it' do
    Peep.create(peep_text: "Here's a test peep")
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Here's a test peep")
  end

end
