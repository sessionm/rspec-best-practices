class Star < ApplicationRecord
  belongs_to :system

  def self.get_composition_for(system)
    raise NotYetImplemented
  end
end
