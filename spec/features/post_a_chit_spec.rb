feature 'Post a chit' do
  let(:message) { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' }
 
  scenario 'I want to make a new chit and post it' do
    post_a_chit(message)

    expect(current_path).to eq '/chits'
    expect(page).to have_content message
  end

  scenario 'I want to post a chit as me' do
    sign_up
    post_a_chit(message) 

    expect(page.find('#chits .panel .panel-heading')).to have_content 'Tester' 
  end
end
