feature 'Reply to a peep' do

  scenario 'Have ability to add reply' do
    signup
    expect(current_path).to eq '/peeps'
    peep
    click_button 'Reply'
    # expect(page).to have_content 'add your knit tip'
  end

end
