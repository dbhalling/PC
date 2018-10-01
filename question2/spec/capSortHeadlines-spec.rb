require "./capSortHeadlines"

  
describe "countryHash" do
  countryHash = CapSort.hash('new_country_data.csv', 'countries')
  
  it "is a hash" do
    expect(countryHash.is_a?(Hash)).to eql true
  end
end

describe "cityHash" do
  cityHash = CapSort.hash('new_citycsv.csv', 'city')
  
  it "is a hash" do
    expect(cityHash.is_a?(Hash)).to eql true
  end
end

describe "test headlines" do
  CapSort.main('test.csv', 'testcsvresult.csv')
  it "has this line" do
    CSV.read('testcsvresult.csv', 'r') do |row|
      expect(row).to eql("United kingdom to play davis cup in Bratislava")
    end
  end
end
  
  
 