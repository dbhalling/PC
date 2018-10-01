require 'csv'

CSV.open('new_country_data.csv', 'w+') do |new_csv|
  CSV.foreach('country-codes_csv.csv') do |row|
    row.each do |col|
      puts col.downcase! unless col.nil?
      puts "end col"
    end
    puts "end row"
    new_csv << row
  end
end