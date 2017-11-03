class Star < ApplicationRecord
  belongs_to :system

  def self.get_composition_for(system)
    raise NotImplementedError
  end

  def get_composition
    raise NotImplementedError
  end
end
