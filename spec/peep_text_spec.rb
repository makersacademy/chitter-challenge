

feature 'Viewing peeps' do
  scenario 'I see existing peeps on the first page' do

    #Peep.create(:id 1, :text 'Hello world!')

    visit('/')
    expect(page).to have_content('Hello world!')
  end
end
