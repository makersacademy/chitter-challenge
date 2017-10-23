feature 'Peep timeline' do

  scenario 'I can post a new Peep' do
    visit '/peeps/new'
    expect(page.status_code).to eq 200

    fill_in :message, with: "This is my first peep!"
    click_button "Peep!"
    
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "This is my first peep!"
  end
  # scenario 'I can see Peeps on my home page' do
  # end
end
