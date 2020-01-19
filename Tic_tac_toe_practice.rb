class Square
    attr_accessor :value

    def initialize(value)
        @value = value
    end

   


    

end


class Grid
    attr_accessor :grid, :player_1, :player_2
    def initialize
        @grid = Array.new(3){Array.new(3){" "}}
        @player_1 = "X"
        @player_2 = "O"
    end


    def move(player)
        done = false
    until done == true
        first = gets.chomp.to_i 
        second = gets.chomp.to_i
        actual = grid[first][second]
    
        if player == "X" && actual == " "
            
                grid[first][second] = "X"
                done = true

        elsif player == "O" && actual == " "
                grid[first][second] = "O"
                done = true
        else
            puts "Looks like that spot is taken.  Try again!"
            
        end
    end
    

    end

    


    def win?
       grid.each do |row| 
            if row.all?("X")
                return true
            elsif row.all?("O")
                return true
            end
       end

       @grid.each.with_index do |row, i|
            if grid[0][i] == "X" && grid[1][i] == "X" && grid[2][i] =="X"
                    return true 
            elsif  grid[0][i] == "O" && grid[1][i] == "O" && grid[2][i] =="O"
                    return true
            end
       end

       if grid[0][0] == "X" && grid[1][1] == "X" && grid[2][2] == "X"
            return true
       elsif grid[0][2] == "X" && grid[1][1] == "X" && grid[2][0] == "X"
            return true 
       elsif grid[0][0] == "O" && grid[1][1] == "O" && grid[2][2] == "O"
            return true
       elsif grid[0][2] == "O" && grid[1][1] == "O" && grid[2][0] == "O"
            return true
       end
       return false
    end

    def draw?
        grid.each do |row|
            row.each do |space|
                return false if space == " "
            end
        end
        true
    end


end



class Play 
    attr_accessor :grid

    def initialize
        @grid = Grid.new
        
    end

    def start
    
        until grid.win? || grid.draw?
            self.display
                puts "Your turn X"
                        grid.move("X")
                        if grid.win? ==true
                            self.display
                            p "You win X!" 
                            break
                        end

                        if grid.draw? 
                            self.display
                            p "Looks like it's a draw!" 
                            break
                        end
            self.display
                 puts "Your turn O"
                        grid.move("O")
                        if grid.win? ==true
                            self.display
                            p "You win O!" 
                        end

                        if grid.draw? 
                            self.display
                            p "Looks like it's a draw!" 
                            break
                        end
            
        end
    end

    def display 
         print grid.grid[0]
            puts
            print grid.grid[1]
            puts
            print grid.grid[2]
            puts
    end

   

    

end


Play.new.start