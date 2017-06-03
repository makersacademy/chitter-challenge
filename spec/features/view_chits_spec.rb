feature 'View chits' do

  scenario 'I can see a list of all the chits' do
   post_a_chit('some random text')
   expect(current_path).to eq '/chits'
   expect(page).to have_content 'some random text'
  end

  scenario 'I can see the chits in reversed chronological order' do
    post_a_chit('random text first')
    post_a_chit('random text second')
    post_a_chit('random text third')

    # expect(page).to have_css('#chits div.panel:first-child .panel-body', text: 'random text third')
    expect(page.find('#chits div.panel:first-child .panel-body')).to have_content 'random text third' 
  end
end
