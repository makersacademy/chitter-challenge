feature 'Feed' do

   before(:each) do
    User.create(name: 'Sachin', email: 'sachin_rocks@gmail.com', 
      password: "1234", 
      password_confirmation: "1234" )
  end

  scenario 'I can add a peep to the feed' do
    signin("factory@girl.com", "1234")
    peep("This is my first peep!")
    expect(current_path).to eq '/feed'
    expect(page).to have_content('This is my first peep!')
  end

  scenario 'I want to see when my peep was created' do
    signin("factory@girl.com", "1234")
    peep("This is a time test")
    expect(current_path).to eq '/feed'
    expect(page).to have_content(Feed.first.created_at.strftime("%R %a %d/%m"))
  end

  scenario 'I can only peep if I am logged in' do
    peep("This should not work!")
    expect(current_path).to eq '/feed/new'
    expect(page).not_to have_content("This should not work!")
  end
end