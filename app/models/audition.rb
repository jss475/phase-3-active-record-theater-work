class Audition < ActiveRecord::Base
  belongs_to :role

  def role
    Role.where("id = ?",self.role_id).first
  end

  def call_back
    self.update_attribute(:hired, true)
  end
end