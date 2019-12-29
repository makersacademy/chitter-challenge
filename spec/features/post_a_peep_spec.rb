feature 'Post and view a peep' do
  scenario 'Should add a peep and show the peep in the list' do
    sign_up
    sign_in

    new_peep('this is some awesome content')

    expect(first('.peep')).to have_content '$user1'
    expect(first('.peep')).to have_content 'this is some awesome content'
    expect(page).to have_current_path '/peeps'
  end


  scenario 'Should be able to post multiple peeps and view in the list' do
    sign_up
    sign_in

    new_peep('this is some awesome content')
    sleep 1
    new_peep('this is some more awesome content')

    expect(page).to have_content '$user1'
    expect(page).to have_content 'this is some awesome content'
    expect(page).to have_content 'this is some more awesome content'
    expect(page).to have_current_path '/peeps'
  end

  scenario 'should list peeps in reverse chronological order' do
    sign_up
    sign_in

    new_peep('this is some awesome content')
    sleep 1
    new_peep('this is some more awesome content')

    expect(first('.peep')).to have_content 'this is some more awesome content'
    expect(first('.peep')).not_to have_content 'this is some awesome content'
    expect(page).to have_current_path '/peeps'
  end

  scenario "should display the time of the post" do
    sign_up

    click_on 'new_peep'
    fill_in 'content', with: "this is some awesome content"
    post_time = Time.now
    click_button 'submit_peep'

    expect(first('.peep')).to have_content post_time.strftime '%H:%M %d/%m/%y'
  end

end
