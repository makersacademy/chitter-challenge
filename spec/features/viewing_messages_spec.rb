feature 'viewing messages (peeps)' do

  scenario "I can see messages on the 'peeps' page" do
    Peep.create(content: 'I love chitter!')
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('I love chitter!')
  end
  
end
