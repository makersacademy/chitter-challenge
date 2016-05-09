feature 'Post peeps' do

  scenario 'I can compose and post a peep' do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello, world!'
    click_button 'Peep!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Hello, world!')
    expect(page).to have_content("#{Time.now.strftime("%m/%d/%Y at %I:%M%p")}")
  end
end
