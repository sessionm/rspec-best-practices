class Planet < ApplicationRecord
  belongs_to :system

  #- proper_name
  #- slug
  #- system
  #- composition
  #- mass
  #- type (terrestrial v jovian)

  def self.get_composition_for(system)
    raise NotYetImplemented
  end

  def terrestrial?
    raise NotYetImplemented
  end

  def jovian?
    raise NotYetImplemented
  end
end
