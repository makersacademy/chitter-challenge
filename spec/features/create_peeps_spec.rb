feature 'create peeps' do
  scenario 'successfully create peep and display it' do
    user_create
    sign_in
    create_peep
    expect(page).to have_content("CHEEP")
  end

  scenario 'successfully create peep and saved in database' do
    user_create
    sign_in
    create_peep
    expect(Peep.first.message).to eq("CHEEP")
  end

end
