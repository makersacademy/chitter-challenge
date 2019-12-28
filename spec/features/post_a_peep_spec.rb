feature 'Post a peep' do
  scenario 'Should add a peep and show the peep in the list' do
    sign_up
    sign_in

    click_on 'new_peep'
    
    fill_in 'content', with: 'this is some awesome commnent'
    click_on 'submit_peep'
    expect(first('.peep')).to have_content '$user1'
    expect(first('.peep')).to have_content 'this is some awesome commnent'
  end
end