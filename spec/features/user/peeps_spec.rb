feature 'creating new peeps' do
  
  scenario 'user can post a new peep' do
    user = build(:user)
    sign_up(user)
    sign_in(user)
    visit('/peeps/new')
    fill_in 'body', with: 'sup peeps!'
    click_button 'peeps away!'
    expect(page).to have_content 'sup peeps!'
  end

end


  # post '/links' do
  #   link = Link.new(url: params[:url],
  #                 title: params[:title])
  #   params[:tags].split(" ").each do |each_tag|
  #     link.tags << Tag.new(name: each_tag)
  #   end
  #   link.save
  #   redirect('/links')
  # end