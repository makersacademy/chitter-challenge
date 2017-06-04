feature 'View chits' do

  scenario 'I can see a list of all the chits' do
   post_a_chit('some random text')
   expect(current_path).to eq '/chits'
   expect(page).to have_content 'some random text'
  end

  scenario 'I can see the chits in reversed chronological order' do
    Chit.create(message: 'first',  time: Time.now + 0)
    Chit.create(message: 'second', time: Time.now + 5)
    Chit.create(message: 'third',  time: Time.now + 10)

    visit '/chits'

    expect(page.find('#chits .panel:first-child .panel-body')).to have_content 'third' 
  end
end
