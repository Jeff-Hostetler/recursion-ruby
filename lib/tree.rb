require 'node'

class Tree

  def initialize
  end

  def print_names(person)
    Node.new(person)
    puts person.name
    person.children.each do |child|
      puts child.name
      child.children.each do |gchild|
        puts gchild.name
      end
    end
  end

  def names(person)
    Node.new(person)
    people = [person.name]
    person.children.each do |child|
      people << child.name
      child.children.each do |gchild|
        people << gchild.name
      end
    end
    people
  end

  def names_with_indentation(person)
    Node.new(person)
    people = [person.name]
    person.children.each do |child|
      people << ("  #{child.name}")
      child.children.each do |gchild|
        people << ("    #{gchild.name}")
        gchild.children.each do |ggchild|
          people << ("      #{ggchild.name}")
        end
      end
    end
    people
  end

  def to_hash(person)
    Node.new(person)
    people = {}
    child_hash= {}
    gchild_hash = {}
    ggchild_hash = {}
    i = 0
    # people = {person.name => child_hash}
    person.children.each do |child|
      if child.children.empty?
        child_hash[child.name] = {}
      else
        child.children.each do |gchild|
          gchild.children.each do |ggchild|
            ggchild_hash[ggchild.name] = {}
            gchild_hash[gchild.name] = ggchild_hash
          end
        end
        child_hash[child.name] = gchild_hash
        people[person.name] = child_hash
      end
    end
    people
  end


end
