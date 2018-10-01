# H1 News Headline Country and City Sorter and Capitalize

# H2 Running the Program
  This program was built using Ruby version 2.4.1
  In order to run the program type and enter
    *"ruby capSortHeadlines.rb"*
  
  Depending on your computer it will take up to three (3) minute for the program
    to run. 
    
  The capitalized and sorted headlines appear in the csv
    *result.csv*
    
# H2 Theory of Operation
  This program creates a hash of the countries and cities.  One headline at a time from the
  headlines CSV (abcnews-date-text.csv) is then compared to the coutry and city hashes.  
  If a match is found in the headline, the cities and/or countries are capitalized along with 
  the first word of the headline. The capitalized headline is then put out to
  the *resultcsv.csv*.
    
# H2 Other Files
  *createCityCSV.rb* creates the *new_citycsv.csv* file, which is used to create
    the cityHash to identify cities in the headlines.
    This orginal city data comes from the *worldcities.csv* file and needs to be modified
    for use in *"ruby capSortHeadlines.rb"*
  *new_citycsv.csv* is used to create the cityHash to identify cities in the headlines.
  *worldcities.csv* is the raw list of cities from (https://simplemaps.com/data/world-cities). 
  *abcnews-date-text.csv* is the raw headlines, before sorting and capitalizing. 
  *createCountryCSV.rb* creates the *new_coountry_data.csv* file, which is used to create
    the countryHash to identify countries in the headlines.
    This orginal country data comes is in  *country-codes_csv.csv* and needs to be modified 
    for use in *"ruby capSortHeadlines.rb"*.
  *country-codes_csv.csv* is the raw list of countries from (https://datahub.io/core/country-codes).
  *new_country_data.csv* is used to create the countryHash to identify countries
    in the headlines.
    
    *spec* is the test file folder.
      *capSortHeadlines_spec.rb* is the test file.
    *test.csv* is a input file used for testing.
    *resultcsvtest* is a result file for testing. 
    
    *Gemfile* has a single gem Rspect
    *Gemfile.lock* is created from the Gemfile
    
    
# H2 Limitations and Extensions
  Presently the program only capitalizes one or two word countries and cities.  However,
  the code is setup to easily be extend to three and more words for countries and cities.  
  It is believed that most headlines will shorten country and city names to two words.
  
  Some of the country names were modified to fit the most likely version that would
  be in a headline.  For instance, "United States of America" was shortened to 
  "United States".
  
  The program does not search for country of city abbreviations. The *country-codes-csv.csv* has the
  official two and three letter abbreviations for the countries, so this could be easily 
  added. 
  
  The program does not search for colloquialisms such as "America" for the 
  "United States of America". 
  
  Presently the program has a number of false positives for cities.  The list of cities being 
  checked is quite extensive (approx 14,000) and many of these cities have names that are 
  common words in English.
  
  The number of false positives could be reduced in a number of ways for instance:
    1) Only check if the first or last word of a headline is a city.  City names are likely to be
      the subject or direct object of a sentence.
    2) Use a list of cities from a specific area.  For instance, only use cities from Australia 
      if the news is from Australia.
  These techniques will increase the number of false negatives however.
  
  The main source of false negatives right now would be from small cities that are not in the 
    the present list of cities.
    
# H2 Testing
  The program has a limited number of tests that could easily be expanded upon.
  
  To run the tests:
    1) comment out line 66 of *CapSortHealines.rb*
      *CapSort.main("abcnews-date-text.csv", "result.csv")*
      This allows the tests to run much faster. 
    2) Run the command below in the console:
      *bundle exec rspec ./spec/capSortHeadlines-spec.rb*
      
      
  
# H2 Notes
  The program process one line of CSV at a time, which allows it to handle very large files.
  Using for the searches should be much faster than an array search or a regex type search.