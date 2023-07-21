fizzbuzz_array = (1..20).to_a
fizzbuzz_array.each do |num|
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
