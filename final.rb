require 'terminal-table'
require 'io/console'
require 'unimidi'
require 'artii'
require 'colorize'
require 'colorized_string'
require 'ascii_charts'

def continue_or_quit
  quit = STDIN.getch.downcase
  print "            \r"
  if quit == "q"; system "cls"; exit end
end

system "cls"
puts "\n\n\n\n                            Did you feel... \n\n"
puts "\n\n         Frustrated".colorize(:red)+" trying to find a door in a dark room?"
sleep(4)
puts "\n\n               That life was"+" unfair ".colorize(:red)+"to you everytime"
puts "                        the lock pick broke? \n\n"
sleep(4)
puts "\n\n               Overwhelmed".colorize(:red)+" by having to come up with"
puts "                  an answer to a complex problem? \n\n\n\n\n"
sleep(2)
puts "                     Press any key to continue"
continue_or_quit
system "cls"

puts "\n\n\n\n                 Many Indigenous Australians, like" + " BINDI \n\n".colorize(:blue)
puts "\n\n           Feel "+"Frustrated".upcase.colorize(:red) + " when interacting with technology"
sleep(4)
puts "\n\n              Are in"+" Unfair ".upcase.colorize(:red)+"disadvantage when it comes to"
puts "               having access to education and technology \n\n"
sleep(4)
puts "\n\n              Are"+" Overwhelmed ".upcase.colorize(:red)+"when trying to catch up with"
puts "           the digital world without a solid support network \n\n\n\n\n"
sleep(2)
puts "                        Press any key to continue"
continue_or_quit
system "cls"
puts "\n\n\n\n                         THE DIGITAL LITEARCY GAP \n\n"
puts "    between Indigenous Australians and non-indigenous households\n\n\n"
puts "                               Shocking!\n\n\n".upcase.colorize(:red)
sleep(4)
puts"""
                                95|    *
                                90|    *
                                85|    *
                                80|    *
                                75|    *
                                70|    *
                                65|  I *
                                60|  I *
                                55|  I *
                                50|  I *
                                45|  I *
                                40|  I *
                                35|  I *
                                30|  I *
                                25|  I *
                                20|  I *
                                15|  I *
                                10|  I *
                                 5|  I *
                                  +--------
"""
sleep(1)
puts "\n\n\n            In Australia’s most disadvantaged communities"
puts "               only 65%".colorize(:red) + " of children aged 5 to 14 years"
puts "       accessed the internet at home over a 12 month period \n\n\n"
sleep(4)
puts "                      Press any key to continue"
continue_or_quit

system "cls"
puts "\n\n\n\n                           Lets GET RID of \n"
puts "                          DIGITAL ILLITERACY\n\n\n\n\n\n".upcase
sleep(2)
puts "                     DONATE NOW AND CLOSE THE GAP!".upcase.colorize(:red)
puts "                           pressing any key\n\n\n\n\n\n"
puts "                   or press 'Q' if you are a QUITTER"
continue_or_quit
