class Audition < ActiveRecord::Base
  belongs_to :role

  def role
    self
  end
end