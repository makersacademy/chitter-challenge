feature 'Creating peeps' do
  scenario "I can create a new peep" do
    visit '/peeps/new'
    fill_in 'Name', with: 'Jonny'
    fill_in 'Message', with: "This is my first peep! I'm so friggin' excited!!!"
    click_button 'Peep this!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is my first peep!'
  end
end
