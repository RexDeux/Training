class TentPlacerTournament
    def initialize(file_path)
        @file_path = file_path
    end

    def calculate_score(opponent_choice, your_choice)
        case your_choice
        when 'X'
            case opponent_choice
            when 'A' then round_score = 3
            when 'B' then round_score = 1
            when 'C' then round_score = 2
            end
        when 'Y'
            case opponent_choice
            when 'A' then round_score = 4
            when 'B' then round_score = 5
            when 'C' then round_score = 6
            end
        when 'Z'
            case opponent_choice
            when 'A' then round_score = 8
            when 'B' then round_score = 9
            when 'C' then round_score = 7
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