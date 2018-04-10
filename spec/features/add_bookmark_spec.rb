feature 'add a bookmark' do
  scenario 'user adds a single bookmark' do
    visit '/bookmarks'
    fill_in 'url', :with => 'http://test-site.com'
    click_button 'Submit'
    expect(page).to have_content('http://test-site.com')
  end
end
