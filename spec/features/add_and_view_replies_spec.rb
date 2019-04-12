feature 'Adding and viewing replies' do
  scenario 'a reply can be added to a peep' do

    sign_up

    test_peep_with_tag

    click_button 'Reply'

    test_reply_with_tag

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'TestReply'
  end
end
