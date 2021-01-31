#i want the last peep to be the first displayed
feature "display peeps in reverse choronological order" do
  scenario 'peeps should be displayed in reverse chronological order' do
   connection = PG.connect(dbname: 'chitter_test')




    connection = PG.connect(dbname: 'chitter_test')
    visit('/')
    fill_in('content', with: 'This is my first peep')
    click_button('Post Peep')

    expect(page).to have_content('This is my first peep')
  end

end
