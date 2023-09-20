require_relative '../level1/main.rb'

# Create an instance of the ElvishExpedition class
expedition = ElvishExpedition.new('./info/input.txt')

# Call the calories method to analyze and find all groups
all_groups_with_sums = expedition.calories

# Print all the results

# all_groups_with_sums.each_with_index do |(group, sum), index|
#   puts "Group #{index + 1}: #{group.inspect}"
#   puts "Sum of Values in Group #{index + 1}: #{sum}"
#   puts "---"
# end
sorted_groups =  all_groups_with_sums.sort_by! {|group, sum| -sum }

top_3_groups = sorted_groups.take(3)

sum_of_top3_groups = top_3_groups.map {|group, sum| sum}.sum

puts "The sum of the top 3 Groups is #{sum_of_top3_groups}"