require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # holiday_hash={
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holiday_data|
    if season == :winter
      holiday_data.each do |holiday, supplies|
        supplies << "Balloons"
      end
    end
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash[season][holiday_name] = supply_array
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
 holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday_data| #holiday data is a hash
  season_caps = season.capitalize.to_s #season are symbols (keys)
  puts "#{season_caps}:" #shows season first
  holiday_caps =[]
  supplies_list=[]
    holiday_data.each do |holiday, supplies| #for each season, show capitalized info
        each_holiday_array = holiday.to_s.split("_") #split each word
        i=0
        while i < each_holiday_array.size
          each_holiday_array[i].capitalize!
          i+=1
        end
      puts "  #{each_holiday_array.join(" ")}: #{supplies.join(", ")}"
    end
end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_holidays=[]
  holiday_hash.map do |season, data|
    data.map do |holiday, supplies|
      i=0
      while i < supplies.size
        if supplies[i]=="BBQ"
        bbq_holidays << holiday
        end
        i+=1
      end
      end
    end
    bbq_holidays
end
