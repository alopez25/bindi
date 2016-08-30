# Users\ainar\Documents\Coding\apps\exercises_ruby
require 'terminal-table'
require 'io/console'
require 'unimidi'
require 'artii'
require 'colorize'
require 'colorized_string'
require 'ascii_charts'

def count_down5
  i=5
  10.times { |x| sleep(1); puts i -= 1}
end

def recovery_ankle
  sleep(3)
  puts "\n\n                             RECOVERING\n\n"
  puts "\n                           Repeat after me:\n\n"
  5.times { |x| sleep(1.5); puts "                          I'm not Usain Bolt".colorize(:red) }
  puts "\n\n\n"
end

def continue_or_quit
  quit = STDIN.getch.downcase
  print "            \r"
  if quit == "q"; exit end
end

def win_sound
  notes = [50,60,60,70,80,80] # C E G arpeggios
  duration = 0.15
  output = UniMIDI::Output.open(:first)
  output.open do |output|
    notes.each do |note|
      output.puts(0x90, note, 100) # note on message
      sleep(duration)  # wait
      output.puts(0x80, note, 100) # note off message
    end
  end
end

def fail_sound
  notes = [30,30,30,30] # C E G arpeggios
  duration = 0.15
  output = UniMIDI::Output.open(:first)
  output.open do |output|
    notes.each do |note|
      output.puts(0x90, note, 100) # note on message
      sleep(duration)  # wait
      output.puts(0x80, note, 100) # note off message
    end
  end
end

initial_V = 0
ravine_distance1 = 5
ravine_distance2 = 4
gravity_acc = 9.806
theta = 0
pass3 = 0
cycles = 5

system = "cls"
puts"\n\n\n\n"
puts "          You go out and see an abyss in front of you!!!\n\n\n".colorize(:red)
sleep(1)
puts "            On the other side you see a comfortable life.."
puts "                           full of luxuries!\n\n\n"
sleep(4)
puts """

          DOOR      YOU                   EVERYTHING GREAT
               ______|_____                 ______|____
              |           |                |           |
              |           |                |           |
              |           |                |           |
              |           |                |           |
              |           |                |           |
              |           |   NOT GOOD     |           |
              |           |    IF YOU      |           |
              |           |     FALL       |           |
              |           |                |           |
              |           |    PAINFUL!    |           |
              |___________|                |___________|
""".colorize(:green)

puts "\n\n\n\n     Press any key to continue or 'Q' if you are a quitter"
continue_or_quit

system "cls"
puts "\n\n\n\n     You struggle to see if you can make it to the other side\n\n"
puts "\n\n              It seems the gap is roughly 4 meters long\n".colorize(:red)
puts "          Try giving it a go by jumping to the other side\n\n\n\n"



until pass3 == 1

puts "        you can always quit with 'Q' or press any other key"
continue_or_quit


system "cls"
puts "\n\n\n\n       Enter the velocity you'd like to reach at the jump".colorize(:green)
puts "                              (in a m/s)"
initial_V = gets.chomp.to_f
until initial_V < 5 do
  fail_sound
  puts "\n\n    You made too much effort and ended up with an ankle sprain".colorize(:red)
  recovery_ankle
  puts "        you can always quit with 'Q' or press any other key"
  continue_or_quit
  system "cls"
  puts "\n\n\n\n                       You can try again now.".colorize(:green)
  puts "                    Enter velocity at jump in m/s"
  initial_V = gets.chomp.to_f
  system "cls"
end

puts "\n\n\n\n                           Enter jump angle".colorize(:green)
puts "                              (in degrees)"
theta = gets.chomp.to_i

case theta
  when (0..10)
    initial_V += 4
  when (11..20)
    initial_V += 3
  when (21..30)
    initial_V += 2
  when (31..35)
    initial_V += 0.5
  else
    initial_V
end

radians = theta * Math::PI/180

range = ((initial_V**2) * (Math.sin(radians*2))) / gravity_acc

if range >= 4
  pass3 += 1
  system "cls"
  win_sound
  puts "\n\n\n\n                         You made it!!!!".colorize(:green)
  puts "            You just jumped #{range} meters"
  win_sound
  sleep(5)
  system "cls"
  puts "\n\n\n\n              You could've made your life easier, however".colorize(:yellow)
  puts "                           Had you calculated... "
  sleep(3)
  puts "\n\n                        the Maximum Jump Distance"
  sleep(4)
  puts "\n                       ...accounting for the..."
  puts "                            Gravity acceleration"
  sleep(4)
  puts "\n\n                         the take-off angle...\n\n"
  puts "                and its efffects on vertical velocity..."
  sleep(4)
  puts "                  and of course horizontal velocity...\n\n\n\n"
  sleep(5)
  puts "                     or simply consulting Google".colorize(:green)
  sleep(2)
  puts "\n\n\n                     Press any key for 'THE END'"
  puts"                          or 'Q' to quit"
  continue_or_quit
  system "cls"
else
  system "cls"
  fail_sound
  puts "\n\n\n\n              You get to the edge and suddenly realize"
  puts "                      you are not going to make it!!!\n\n".colorize(:red)
  puts "     You stop and take a breath before trying a jump again"
  sleep(2)
  puts "\n\n                         TAKING A BREATH\n\n".colorize(:red)
  cycles.times { |x| sleep(1.5); puts "                         == RECOVERING ==" }
  puts "\n\n"
  cycles +=1
end

end
