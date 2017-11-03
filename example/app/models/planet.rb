class Planet < ApplicationRecord
  belongs_to :system

  def self.get_composition_for(system)
    raise NotImplementedError
  end
end
