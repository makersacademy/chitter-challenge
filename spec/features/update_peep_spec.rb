feature "Update post" do
  scenario 'User is able to edit a post' do 
    time = Time.new(2002,02,02)

    peep = Peep.create(text: 'This is a test peep', time: "#{time}" )
    visit('/chitter')

    expect(page).to have_content"This is a test peep made on 2002-02-02 00:00:00"

    first('.peep').click_button'edit'
    expect(current.path).to eq "/chitter/#{peep.id}/edit"

    fill_in('peep', with: "This is an updated test peep")
    click_button('submit')

    expect(current_path).to eq '/chitter'
    expect(page).not_to have_content("This is a test peep made on 2002-02-02 00:00:00")
    expect(page).to have_content("This is an updated test peep made on 2002-02-02 00:00:00")
  end 
end 
