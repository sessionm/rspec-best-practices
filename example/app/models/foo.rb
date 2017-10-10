class Foo < ApplicationRecord
  #test validation
  def self.get_full_name
  end
end


class Galaxy < ApplicationRecord
  #- ...
end

class SolarSystem < ApplicationRecord
  def get_stars
    Star.where(system: self.id)
  end

  def get_planets
    Planet.where(system: self.id)
  end

  def has_planets?
    !!Planet.count(system: self.id)
  end

  def binary?
    Star.count(system: self.id) == 2
  end

  def trinary?
    Star.count(system: self.id) == 3
  end


  def get_composition
    star_composition = Star.get_composition_for(system)
    planet_composition = Planet.get_composition_for(system)

    star_composition | planet_composition
  end
end

class Element < ApplicationRecord
  #- name
  #- slug
  #- abbreviation
  #- atomic weight
end

class Star < ApplicationRecord
  #- proper_name
  #- slug
  #- composition
  #- mass

  def self.get_composition_for(system)
    self.where(system: system).each do |star|
      star.get_composition
    end
  end
end

class Planet < ApplicationRecord
  #- proper_name
  #- slug
  #- system
  #- composition
  #- mass
  #- type (terrestrial v jovian)

  def self.get_composition_for(system)
    self.where(system: system).each do |planet|
      planet.get_composition
    end
  end

  def terrestrial?
  end

  def jovian?
  end
end
