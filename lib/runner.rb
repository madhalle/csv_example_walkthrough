require "./lib/csv_parser"
CsvParser.new('./data/animal_lovers.csv', './data/magical_pets.csv').parse_all_csvs
