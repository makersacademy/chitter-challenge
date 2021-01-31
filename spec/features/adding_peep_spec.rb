feature 'Adding a peep' do

  scenario 'Shows it on the home page' do
    visit('/')
    fill_in('content', with: "peep peep, I'm in me mum's car")
    click_button('Share')
    expect(page.status_code).to eq 200
    expect(page).to have_content("peep peep, I'm in me mum's car")
  end

  scenario 'lists peeps by reverse chronological order' do
    visit('/')
    fill_in('content', with: "peep peep, I'm in me mum's car")
    click_button('Share')
    fill_in('content', with: "I'm no longer in me mum's car")
    click_button('Share')
    expect(page.status_code).to eq 200
    expect(page.body.index("I'm no longer in me mum's car")).to be < page.body.index("peep peep, I'm in me mum's car")
  end

end
