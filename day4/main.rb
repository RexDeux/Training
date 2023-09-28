class ElvishRugsacking
    def initialize(file_path)
        @file_path = file_path
    end
    
    def item_priority(item)
        if ('a'..'z').include?(item)
          return item.ord - 'a'.ord + 1
        elsif ('A'..'Z').include?(item)
          return item.ord - 'A'.ord + 27
        else
          return 0
        end
    end

    def calculate_total_priority_sum
        total_priority_sum = 0
    
        rugsacks.each do |rucksack|
          half_length = rucksack.length / 2
          compartment1 = rucksack[0, half_length]
          compartment2 = rucksack[half_length..-1]
    
          common_item = compartment1.chars.detect { |item| compartment2.include?(item) }
    
          if common_item
            common_item_priority = item_priority(common_item)
            total_priority_sum += common_item_priority
          end
        end
    
        total_priority_sum
      end
    
      private
    
      def rugsacks
        content = File.read(@file_path)
        content.split("\n")
      end
    end
    
    # Create an instance of ElvishRugsacking with the input file path
    rucksacking = ElvishRugsacking.new('./info/input.txt')
    
    # Calculate the total priority sum and print the result
    total_priority_sum = rucksacking.calculate_total_priority_sum
    puts "Total Priority Sum: #{total_priority_sum}"