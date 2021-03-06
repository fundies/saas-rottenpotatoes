# Seed the RottenPotatoes DB with some movies.
more_movies = [
  {:title => 'Aladdin', :rating => 'G',
    :release_date => '25-Nov-1992', :description => 'When a street urchin vies for the love of a beautiful princess, he uses a genie\'s magic power to make himself off as a prince in order to marry her.'},
  {:title => 'When Harry Met Sally', :rating => 'R',
    :release_date => '21-Jul-1989', :description => 'Harry and Sally have known each other for years, and are very good friends, but they fear sex would ruin the friendship.'},
  {:title => 'The Help', :rating => 'PG-13',
    :release_date => '10-Aug-2011', :description => 'An aspiring author during the civil rights movement of the 1960s decides to write a book detailing the African-American maids\' point of view on the white families for which they work, and the hardships they go through on a daily basis.'},
  {:title => 'Raiders of the Lost Ark', :rating => 'PG',
    :release_date => '12-Jun-1981', :description => 'Archaeologist and adventurer Indiana Jones is hired by the US government to find the Ark of the Covenant before the Nazis.'}
]

more_movies.each do |movie|
  Movie.create!(movie)
end
