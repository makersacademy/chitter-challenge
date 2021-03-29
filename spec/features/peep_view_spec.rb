describe 'chitter' do
  feature 'View peeps' do
    scenario 'User can view peeps' do
      Peep.add(peep: 'Makers', account: 'Makers')
      visit('/')
      expect(page).to have_content('Makers')
    end
  end

  feature 'Post peeps' do
    scenario 'User can post a peep to chitter' do
      con = PG.connect(dbname: 'chitter_test')
      visit('/')
      fill_in('peep', with: 'This is a new peep')
      click_button('New Peep')
      expect(page).to have_content('This is a new peep')
    end
  end

feature 'Delete peeps' do
  scenario 'User can delete peeps' do
    con = PG.connect(dbname: 'chitter_test')
    visit('/')
    fill_in('peep', with: 'This is a new peep')
    click_button('New Peep')
    expect(page).to have_content('This is a new peep')
    first('.peep').click_button 'Delete'
    expect(current_path).to eq '/'
    expect(page).not_to have_content('This is a new peep')
  end
end

feature 'User Sign Up' do
  scenario 'User can sign up to chitter' do
    con = PG.connect(dbname: 'chitter_test')
    visit('/')
    click_button('Sign up for Chitter here')
    expect(current_path).to eq '/users/new_user'
    fill_in('name', with: 'Lisa')
    fill_in('email', with: 'lisa@thesimpsons.com')
    fill_in('password', with: 'springfield')
    click_button('Sign Up')
    expect(page).to have_content('Welcome Lisa')
  end
end

feature 'Edit Peeps' do
  scenario "User can edit a posted peep message" do
    peep = Peep.add(peep: 'Makers is great', account: 'Makers')
    visit('/')
    expect(page).to have_content('Makers is great')
    first('.peep').click_button 'Edit'
    expect(current_path).to eq "/#{peep.id}/edit"
    fill_in('peep', with: "Makers is the best!")
    click_button('Edit Peep')
    expect(current_path).to eq '/'
    expect(page).not_to have_content('Makers is great')
    expect(page).to have_content('Makers is the best!')
  end
 end

 feature 'Add replies to Peeps' do
   scenario 'User can add a new reply to a peep message' do
     peep = Peep.add(peep: 'Makers is great', account: 'Makers')
     visit('/')
     first('.peep').click_button 'Reply'
     expect(current_path).to eq "/#{peep.id}/replies/new_reply"
     fill_in 'reply', with: 'Makers rocks!!!'
     click_button 'Submit'
     expect(current_path).to eq '/'
     expect(first('.peep')).to have_content 'Makers rocks!!!'
   end
 end
end
