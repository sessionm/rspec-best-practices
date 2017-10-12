class SolarSystem < ApplicationRecord
  def get_stars
    Star.where(system: self.id)
  end

  def get_planets
    Planet.where(system: self.id)
  end

  def has_planet?
    Planet.exists?(system: self.id)
  end

  def binary?
    Star.count(system: self.id) == 2
  end

  def trinary?
    Star.count(system: self.id) == 3
  end

  def get_composition
    stars_composition = Star.get_composition_for(system: self)
    planets_composition = Planet.get_composition_for(system: self)

    stars_composition | planets_composition
  end
end
