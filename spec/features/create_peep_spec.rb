feature 'creating peeps' do

  scenario 'creating new peep' do
    sign_up
    visit '/peeps/new'
    expect(page.status_code).to eq(200)
    fill_in :content, with: 'This is my first peep'
    click_button 'Peep'
    expect(page).to have_content 'This is my first peep'
  end

  scenario 'creating peep when not logged in' do
    visit '/peeps/new'
    expect(page).to have_content('You are not logged in, please log in or sign up')
  end
end
