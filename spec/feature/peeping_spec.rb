feature 'peeping' do
  scenario 'I post a peep' do
    visit('/')
    sign_up
    peep('this is my #first peep')
    expect(current_path).to eq('/')
    expect(page).to have_content('this is my #first peep')
  end

  scenario 'I can see peeps in correct order' do
    visit('/')
    sign_up
    peep('this is my #first peep')
    peep('this is my #second peep')
    expect(current_path).to eq('/')
    page.should have_selector("ul#peeps li:nth-child(2)", text: 'this is my #second peep')
    page.should have_selector("ul#peeps li:nth-child(1)", text: 'this is my #first peep')
  end

  scenario 'I want to see the time at which it was made' do
    visit('/')
    time = DateTime.now.strftime("%I:%M%p %m/%d/%Y")
    sign_up
    peep('this is my #second peep')
    expect(current_path).to eq('/')
    expect(page).to have_content('this is my #second peep')
    expect(page).to have_content("#{time}")
  end

end
