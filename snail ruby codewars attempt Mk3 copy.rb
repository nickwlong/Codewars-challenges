def snail(arr)
    snail_trail = []
    snail_innards = arr

    if snail_innards == [[]]
        return []
    elsif snail_innards.size == 1
        return arr[0]

    else 
        while snail_innards.size > 0
            if snail_innards.size > 3

                #top row: return the top row of square (same as the first array)
                snail_trail.push(snail_innards[0])

                #right-side
                for i in 1..(snail_innards.size)-2
                    snail_trail.push(snail_innards[i][-1])
                end
                #bottom row
                snail_trail.push(snail_innards[-1].reverse)

                #left side
                x = snail_innards.size - 2
                while x > 0
                    snail_trail.push(snail_innards[x][0])
                    x -= 1
                end

                #slice the array from the 1st index to arr.size-2 and then slice each nested array in the same way.
                snail_innards = snail_innards.slice(1, snail_innards.size-2).map{|nest| nest.slice(1, nest.size-2)}
            elsif snail_innards.size == 3
                snail_trail.push(snail_innards[0]).push(snail_innards[1][-1])
                snail_trail.push(snail_innards[-1].reverse).push(snail_innards[1][0..1])
                break
            elsif snail_innards.size == 2
                snail_trail.push(snail_innards[0]).push(snail_innards[1].reverse)
                break
            end
        end
    end

    arr ? snail_trail.flatten : arr
end

puts "Test one 4x4"
p snail([[1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
    [13,14,15,16]])
puts "Test two 3x3"
p snail([[1,2,3],
    [4,5,6],
    [7,8,9]])
puts "Test three 2x2"
p snail([[1,2],
    [3,4]])
puts "Test four 5x5"
p snail([[1,2,3,4,5],
    [6,7,8,9,10],
    [11,12,13,14,15],
    [16,17,18,19,20],
    [21,22,23,24,25]])
puts "Test five 10x10"
p snail([[1,2,3,4,5,6,7,8,9,10],
    [11,12,13,14,15,16,17,18,19,20],
    [21,22,23,24,25,26,27,28,29,30],
    [31,32,33,34,35,36,37,38,39,40],
    [41,42,43,44,45,46,47,48,49,50],
    [51,52,53,54,55,56,57,58,59,60],
    [61,62,63,64,65,66,67,68,69,70],
    [71,72,73,74,75,76,77,78,79,80],
    [81,82,83,84,85,86,87,88,89,90],
    [91,92,93,94,95,96,97,98,99,100]])
puts "Zero test"
p snail([[]])
puts "1 test"
p snail([[1]])