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
    
    grouped_integers << current_group unless current_group.empty? && current_group.is_a?(Array)

    grouped_integers.map { |group| [group, group.sum] }
    end

    def largest_group
        grouped_data = calories
        largest_group= grouped_data.max_by { |group, sum| sum}
        largest_group[0]
    end  
end

expedition = ElvishExpedition.new('./info/input.txt')

largest_group = expedition.largest_group

# Print the largest group and its sum
puts "Largest Group: #{largest_group.inspect}"
puts "Sum of Values in Largest Group: #{largest_group.sum}"