feature 'Adding hashtags' do
  scenario 'I can add a hashtag to my peeps' do
    sign_up
    visit '/peeps/add'
    fill_in 'peep_content', with: 'Something different for now'
    fill_in 'hashtags', with: 'random'
    click_button 'Add peep'
    expect(current_path).to eq '/peeps'

  end

  # scenario 'I can add multiple hashtags to my peeps' do
  #   sign_up
  #   visit '/peeps/add'
  #   fill_in 'peep_content', with: 'Christmas pudding in summer?'
  #   fill_in 'hashtags', with: 'food seasonal'
  #   click_button 'Add peep'
  # end

end
