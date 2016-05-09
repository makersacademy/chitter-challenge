 feature 'Index Page' do

   scenario 'displays a welcome message' do
     visit '/'
     expect(page).to have_content 'Welcome to Chitter!'
     expect(page).to have_content 'Please choose one of the options below to proceed'
   end

   scenario 'user has an option to sign up when they visit' do
     visit '/'
     click_button 'Sign Up'
     expect(current_path).to eq '/users/new'
   end

   scenario 'user has an option to sign in when they visit' do
     visit '/'
     click_button 'Sign In'
     expect(current_path).to eq '/sessions/new'
   end

  scenario 'user can view cheeps' do
    visit '/'
    click_button 'See what people are saying!'
    expect(current_path).to eq '/posts/view'
  end


 end