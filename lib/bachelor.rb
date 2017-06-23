require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    return contestant["name"].split(" ").first if contestant["status"] == "Winner"
  end

end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    contestants.each do |contestant|
      return contestant["name"] if contestant["occupation"] == occupation
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  data.collect do |season, contestants|
    contestants.select do |contestant|
      contestant["hometown"] == hometown
    end
  end.flatten.compact.length
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
    contestants.each do |contestant|
      return contestant["occupation"] if contestant["hometown"] == hometown
    end
  end
end

def get_average_age_for_season(data, season)
  (data[season].collect{|contestant| contestant["age"].to_f}.reduce(:+)/data[season].length).round
end
