feature 'Reply to a peep' do

  scenario 'Have ability to add reply' do
    signup
    expect(current_path).to eq '/peeps'
    peep
    click_button 'Reply'
    reply
    expect(page).to have_content 'Thats so true'
  end

end
