feature 'Creating peeps' do

  scenario 'I can let people know what I am doing' do
    visit '/'
    sign_up
    log_in
    peep
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Walter is a softy')
      expect(page).to have_content('@DennisDaMennace')
    end
  end

  scenario 'I cannot peep without being logged in' do
    visit '/'
    expect(page).not_to have_content 'Create a peep'
  end

  scenario 'I cannot peep without being signed in' do
    visit '/'
    expect(page).not_to have_content 'Create a peep'
  end

end
