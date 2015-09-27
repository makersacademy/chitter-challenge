feature 'Viewing peeps' do

  scenario 'visiting the home page I see the peeps listed' do
    Peep.create(heading: "Peep 1", message: "First peep")
    Peep.create(heading: "Peep 2", message: "Next peep")
    visit '/'
    expect(page).to have_content "First peep"
    expect(page).to have_content "Next peep"
  end

end

feature 'Adding peeps' do

  let(:user){build :user}

  before do
    create :user
    log_in(user)
  end

  scenario '' do
    visit '/'
    click_button 'New peep!'
    expect(current_path).to eq '/peeps/new'
    fill_in 'heading', with: 'Peep 1'
    fill_in 'message', with: 'My first peep'
    click_button 'Post peep!'
    expect(current_path).to eq '/'
    expect(page).to have_content "My first peep"
  end

end