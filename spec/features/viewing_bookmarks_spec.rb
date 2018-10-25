require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
