class Star < ApplicationRecord
  #belongs_to :composition
  belongs_to :system

  def self.get_composition_for(system)
   return 'test'
  end
end
