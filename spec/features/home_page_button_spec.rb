feature 'Send user to add page' do
  scenario 'A user clicks a link that send them to the peep page' do
    visit '/'
    click_button 'Submit'
    expect(current_path).to eq '/peeps/new'
    expect(page).to have_content'Henlo'
  end
end
