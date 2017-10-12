class Planet < ApplicationRecord
  belongs_to :system

  #- proper_name
  #- slug
  #- system
  #- composition
  #- mass
  #- type (terrestrial v jovian)

  def self.get_composition_for(system)
    #self.where(system: system).each do |planet|
    #  planet.get_composition
    #end
  end

  def terrestrial?
  end

  def jovian?
  end
end
