require 'property'

describe '.all' do
  it 'returns a list of all properties' do
    connection = PG.connect(dbname: 'makersbnb_test')
    #add the test data
    Property.create(name: 'Buckingham Palace', description: "Big old house, one old lady currently inhabiting", price_per_night: 10)
    properties = Property.all

    expect(properties[0].name).to eq 'Buckingham Palace'
    expect(properties[0].description).to eq "Big old house, one old lady currently inhabiting"
    expect(properties[0].price_per_night.to_i).to eq 10
  end

end
