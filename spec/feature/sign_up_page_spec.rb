feature 'A user puts in their sign up information' do 
  scenario 'after a user has put in valid info they go to home page' do 
    visit('/')
    click_button "Sign Up"
    expect(page).to have_field('Full Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Username')
    expect(page).to have_field('Password')
    click_button "Submit"
    expect(current_path).to eq "/home"
  end 
end 