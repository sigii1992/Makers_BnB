require 'pg'

feature 'View all properties' do
  scenario 'A user can see all properties' do
    Property.create(name: 'Buckingham Palace', description: "Big old house, one old lady currently inhabiting", price_per_night: 10)

    visit('/')
    click_link('click here')
    visit('/properties')
    expect(page).to have_content('Buckingham Palace')
  end 
end
