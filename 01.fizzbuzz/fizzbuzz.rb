(1..20).each do |num|
   if  num % 3 == 0 && num % 5 == 0
    print "Fizz"
    puts "Buzz"
   elsif num % 3 == 0
    puts "Fizz"
   elsif num % 5 == 0
    puts "Buzz"
   else
    puts num
   end
end
