class CapSort
  require 'csv'

  def self.hash(csv, indentifier)
    i = 1
    hash = indentifier + "Hash"
    hash = Hash.new
    CSV.foreach(csv, headers: true) do |row|
      words = row[indentifier]
      words_list = words.split
      word_count = words_list.count
      if word_count == 1
        hash[words.to_sym] = [1]
      elsif word_count > 1
        first_word = words_list.first.to_sym
        hash[first_word] = [] unless hash[first_word] != nil
        hash[first_word].push(words.sub(first_word.to_s + ' ', ''))
      end
      i += 1
    end
    return hash
  end
  
  def self.findCountry(headline, countryHash)
      capWordArray = []
      splitHead = headline.split
      count = splitHead.length - 1
      for i in 0..count
        if countryHash[splitHead[i].to_sym].is_a?(Array)
          if countryHash[splitHead[i].to_sym].include?(splitHead[i + 1])
            country = splitHead[i] + " " + splitHead[i + 1]
            capWordArray.push(country)
          elsif countryHash[splitHead[i].to_sym].include?(1)
            country = splitHead[i]
            capWordArray.push(country)
          end 
        else
        end
      end
      return capWordArray
  end
  
  def self.main(csv_name, output_csv)
    countryHash = hash('new_country_data.csv', 'countries')
    cityHash = hash('new_citycsv.csv', 'city')
    
    CSV.open(output_csv, 'w+') do |new_csv|
      CSV.foreach(csv_name, headers: true) do |row|
        cntUncapWordArray = findCountry(row['headline_text'], countryHash)
        ctUncapWordArray = findCountry(row['headline_text'], cityHash)
        uncapWordArray = cntUncapWordArray.concat(ctUncapWordArray)
        
        uncapWordArray.each do |uncap_words|
          row["headline_text"] = row["headline_text"].gsub(uncap_words, uncap_words.split.map(&:capitalize)*' ')
          row["headline_text"] = row["headline_text"].sub(row["headline_text"].split[0], row["headline_text"].split[0].capitalize)
        end
        unless uncapWordArray == []
          new_csv << [row["headline_text"]]  
        end
      end
    end
  end
  
end

CapSort.main("abcnews-date-text.csv", "result.csv")

 