require 'csv'

cityCSVArray = CSV.read('worldcities.csv', headers: true)

cityArray = []
cityCSVArray.each do |city|
  cityArray.push(city[0])
end

cityArray.uniq!
cityArray.sort!
cityArray.unshift("City")

CSV.open('new_citycsv.csv', 'w+') do |new_csv|
  cityArray.each do |c|
    new_csv << [c.downcase!]
  end
end  