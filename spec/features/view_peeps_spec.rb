feature 'displays peeps' do
  before(:all) do
    sign_up
    post_peep('1')
    post_peep('2')
    post_peep('3')
  end

  scenario 'peeps are shown in reverse chronological order' do
    visit '/'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text: '3')
    expect(page).to have_selector("ul#peeps li:nth-child(2)", text: '2')
    expect(page).to have_selector("ul#peeps li:nth-child(3)", text: '1')
  end

  scenario 'displays name and username for each peep' do
    visit '/'
    expect(page).to have_content("New User whoami\n1")
  end

end
