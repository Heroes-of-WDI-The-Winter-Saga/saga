# require 'pry'

party = {
  "hero" => [10,5,5]
}


npc = {
  "enemy" => [6,4,4],
  "name" => ["Tyler","Sean"]
}

cs = 0

def death(party, npc, cs)

  p "Oh No #{hero}! You have died!"
  p "You have slayed #{cs} enemies!"
  cs = 0
  party["hero"][0] = 10
  party["hero"][1] = 5
  party["hero"][2] = 5
  party["enemy"][0] = 6
  party["enemy"][1] = 4
  party["enemy"][2] = 4
  p "Would you like to play again?"
  input = gets.chomp.downcase

  if input == "yes"
    story(party, npc)
  elsif input == "no"
  else
    p " that is an incorrect input say either 'yes' or 'no'"
  end
end

def battle(party, npc, cs)

  # default values
  totalhp = party["hero"][0]
  enemyhp = npc["enemy"][0]
  hstr = party["hero"][1]
  estr = npc["enemy"][1]
  hdef = party["hero"][2]
  edef = npc["enemy"][2]

  while party["hero"][0] > 0 || npc["enemy"][0] > 0
    p "How will you proceed? Attack, drink a health potion, block or run?"

    input = gets.chomp.downcase

    if input == "attack"
      if 1+rand(5) == 1
        p "Your attack missed."
      elsif 1+rand(5) != 1
        edamage = 1 + rand(hstr.to_i)
      end
    elsif input == "block"
      hdef = hdef *2
      p "You are blocking."
    elsif input == "potion" || input == "heath potion"
      party["hero"][0] = total hp
    elsif input == "run"
      party["hero"][0] = party["hero"][0] - 2
      p "You escape! You have lost 2 health during your escape!"

      story(party,npc, cs) #should initiate story fuction

    elsif input != "run" || input != "attack"
      p "That is an inproper command try again."
      # story(party,npc)
    end

    if npc["enemy"][0] > enemyhp/2
      if 1 + rand(10) == 10
        edef = edef * 2
        p "The enemy is blocking!"
      else
        if 1+rand(5) <= 2
        p "The enemies attack misses!"
        elsif 1+rand(5) >= 3
          hdamage = 1 + rand(estr.to_i)
        end
      end
    else
      if 1 + rand(2) == 1
        edef = edef * 2
        p "The enemy is blocking!"
      else
        if 1+rand(5) <= 2
          p "The enemies attack misses!"
        elsif 1+rand(5) >= 3
          hdamage = 1 + rand(estr.to_i)
        end
      end

      # damage calclation to the target
      # damage is subtracted by a random number rolled between 1 and the defenders defense.
      edamage = edamage.to_i - (1 + rand(edef.to_i))
        if input == "block"
        elsif edamage <= 0
          p "Your attack failed!"
          edamage = 0
        else
          p "You hit for #{edamage} damage!"
        end

      # damage calculation to the hero
      hdamage = hdamage.to_i - (1 + rand(hdef.to_i))
        if hdamage <= 0
          p "The enemies attack has failed!"
          hdamage = 0
        else
          p "You've been hit for #{hdamage} damage!"
        end
      end

    party["hero"][0] = party["hero"][0] - hdamage.to_i
    npc["enemy"][0] = npc["enemy"][0] - edamage.to_i
    p "You have #{party["hero"][0]} health."
    p "The enemy has #{npc["enemy"][0]} health"

    hdef = 5
    edef = 4

    if npc["enemy"][0] <= 0
      p "You have defeated the enemy!"
      party["hero"][0] = totalhp
      npc["enemy"][0] = enemyhp
      cs = cs + 1
      story(party, npc, cs)
    elsif party["hero"][0] <= 0
      death(party, npc, cs)
    end
  end
end

def story(party, npc, cs)
# binding.pry
  
  if cs % 3 == 0
    p "Hey you have a point to spend! Put it into health, strength, or defense"
    input = gets.chomp.downcase
    if input == "health"
      party["hero"][0] = party["hero"][0] + 1
    elsif input == "strength"
      party["hero"][1] = party["hero"][1] + 1
    elsif input == "defense"
      party["hero"][2] = party["hero"][2] + 1
    end
  end


  while party["hero"][0] >= 1

    p "A #{npc["name"][0+rand(2)]} is approaching. (Will you \"fight\" or \"flee\")"

    input = gets.chomp.downcase

    if input == "flee"
      party["hero"][0]  = party["hero"][0] - 2
      p "you escape but you've taken some damage! Your current health is at #{party["hero"][0]}"

    elsif input == "fight"
      p "You engage the enemy!"
      battle(party, npc, cs)
    end
  end
  death(party, npc, cs)
end


p "What is your hero's name?"
hero = gets.chomp
p "Welcome #{hero}, prepare for battle."

story(party, npc, cs)
