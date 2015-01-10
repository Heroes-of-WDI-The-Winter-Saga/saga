require "pry"

i = 0

party = {
  "hero" => [10],
  "name" => ["Batman","Spiderman","WDI-man","Turtleman"]
}

npc = {
  "enemy" => [6,4,4],
  "name" => ["Cookie Monster","Flying Teapot","Mad Man","Wicked Dutchman"]
}

def battle(party, npc)

  herohp = party["hero"][0]
  enemyhp = npc["enemy"][0]

  while party["hero"][0] > 0 || npc["enemy"][0] > 0
    p "How will you proceed? Attack or block?"
    input = gets.chomp.downcase

    if input == "attack"
      if 1+rand(5) == 1
        p "Your attack missed."
      elsif 1+rand(5) != 1
         edamage = 2 + rand(3)
        p "You hit for #{edamage} damage!"
      end

      if 1+rand(5) <= 2
        p "The enemies attack misses!"
      elsif 1+rand(5) >= 3
        hdamage = 1 + rand(3)
        p "You've been hit for #{hdamage} damage!"
      end

    elsif input == "block"
      party["hero"][0] = party["hero"][0] - 2
      p "You block, but have lost 2 health during your escape!"
      story(party,npc) #should initiate story fuction

    elsif input != "run" || input != "attack"
      p "That is an inproper command try again."
    end

    party["hero"][0] = party["hero"][0] - hdamage.to_i
    npc["enemy"][0] = npc["enemy"][0] - edamage.to_i
    p "You have #{party["hero"][0]} health."
    p "The enemy has #{npc["enemy"][0]} health"

    if npc["enemy"][0] <= 0
      p "You have defeated the enemy!"
      break
    end

    break
  end

end

def story(party, npc)
# binding.pry

  while party["hero"][0] > 0 && npc["enemy"][0] > 0

    p "A #{npc["name"][(1+rand(npc["name"].length)-1)]} is approaching. Will you 'fight' or 'run'"

    input = gets.chomp.downcase

    if input == "run"
      party["hero"][0]  = party["hero"][0] - 2
      p "You run, but have lost 2 health during your escape!"
    elsif input == "fight"
      p "You engage the enemy!"
      battle(party, npc)
    end
  end

end

def intro(party,npc,i)

  p "Who will be your hero? Choose from the following hero's (1,2,3 or 4):"
  #binding.pry
  while i < party["name"].length
    p "#{i+1} #{party["name"][i]}"
    i += 1
  end

  choice = party["name"][gets.chomp.to_i - 1]

  p "Welcome #{choice}, prepare for battle."

  p "press <ENTER> to start the game"

  while gets != "\n"
    p "press <ENTER> to start the game"
    if gets == "\n"
      story(party, npc)
    end
  end

end

intro(party,npc,i)
