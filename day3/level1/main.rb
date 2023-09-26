class TentPlacerTournament
    def initialize(file_path)
        @file_path = file_path
    end

    def calculate_score(opponent_choice, your_choice)
        case opponent_choice
        when 'A' #Rock
            case your_choice
            when 'X' then 4 #Rock
            when 'Y' then 8 #Paper
            when 'Z' then 3 #Scissors
            end
        when 'B' #Paper
            case your_choice
            when 'X' then 1 #Rock
            when 'Y' then 5 #Paper
            when 'Z' then 9 #Scissors
            end
        when 'C' #Scissors
            case your_choice
            when 'X' then 7 #Rock
            when 'Y' then 2 #Paper
            when 'Z' then 6 #Scissors
            end
        else
            0
        end
    end
    
        # game rules    
        # A for Rock, B for Paper, and C for Scissors
        # ME - X for Rock , Y for paper , Z for Scissors
        # (1 for Rock, 2 for Paper, and 3 for Scissors)
        # (0 if you lost, 3 if the round was a draw, and 6 if you won)

    def game_results
        total_score = 0
        content = File.read(@file_path)
        pairs = content.split("\n")
        pairs.each do |line|
            opponent_choice, your_choice = line.split
            round_score = calculate_score(opponent_choice, your_choice)
            total_score += round_score
        end
        total_score
    end
end

rockpaperscissors = TentPlacerTournament.new('./info/input.txt')

game_results = rockpaperscissors.game_results

puts "Following the strategy my total score would be #{game_results}"