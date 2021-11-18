require 'pg'

feature 'add new properties' do
  scenario 'a property can be added to the database' do
    # connection = PG.connect(dbname: 'makersbnb_test')
    User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')

    visit('/')
    click_button('Log in')
    visit('/users/login')
    fill_in :email, with: 'hagrid@gmail.com'
    fill_in :password, with: 'hagrid123'
    click_button('Sign in')
    click_button('Add property')
    visit('/properties/new')
    fill_in :name, with: 'Buckingham Palace'
    fill_in :description, with: 'Can fit up to 100 people with space to spare, centrally located'
    fill_in :price_per_night, with: 10
    click_button('List property')
    expect(page).to have_content 'Buckingham Palace'
    
  end
end