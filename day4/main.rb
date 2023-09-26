class ElvishRugsacking
    # def initialize(file_path)
    #     @file_path = file_path
    # end
    
    def rugsack_content
        file_path = './info/input.txt'
        content = File.read(file_path)
        rugsack = content.split("\n")
        #divide them by line
        #divide them in half
    end
end