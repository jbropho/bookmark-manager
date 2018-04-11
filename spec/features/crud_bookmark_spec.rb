feature 'user performs CRUD operations on bookmark resource' do
  scenario 'user adds a single bookmark' do
    visit '/bookmarks'
    fill_in 'url', :with => 'http://test-site.com'
    click_button 'Submit'
    expect(page).to have_content('http://test-site.com')
  end

  scenario 'user visits view page' do
    Database::add_test_data
    visit('/bookmarks')
    page.assert_selector(:link, nil, href: 'http://www.github.com')
  end

  scenario 'user deletes a bookmark' do
    Database::add_test_data
    visit('/bookmarks')
    delete = page.find_by_id("delete-github")
    delete.click
    page.assert_selector(:link, nil, href: 'http://www.github.com', count: 0)
  end
end
