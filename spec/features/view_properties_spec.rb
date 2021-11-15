require 'pg'

feature 'View all properties' do
  scenario 'A user can see all properties' do
    visit('/')
    click_button('View Properties')
    visit('/properties')
    expect(page).to have_content('Property 1')
  end
end
