class ElvishExpedition

    def initialize(file_path)
        @file_path = file_path
    end

    def calories
    # Read the file
    content = File.read(@file_path)

    # Initialize an array to store the grouped integers
    grouped_integers = []
    current_group = []

    # Process each line in the content
    content.each_line do |line|
        line.chomp!  # Remove trailing newline characters
        if line.empty?
            # If the line is empty, it's a separator, so start a new group
            grouped_integers << current_group unless current_group.empty?
            current_group = []  # Reset the current group
        else
            # Split the line by spaces and convert to integers
            integers = line.split(' ').map(&:to_i)
            current_group.concat(integers)  # Add the integers to the current group
        end
    end
    
    grouped_integers << current_group unless current_group.empty?

    largest_group = grouped_integers.max_by { |group| group.sum }

    [largest_group, largest_group.sum]
    end
end

process = ElvishExpedition.new('info/input.txt')
largest_calories, sum = process.calories

puts "Largest Group: #{largest_calories.inspect}"
puts "Sum of Values in Largest Group: #{largest_calories.sum}"