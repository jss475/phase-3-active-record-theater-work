require 'pry'
class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
        Audition.where("role_id = ?",self.id)
    end

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
        find_arr = self.auditions.find_by hired: true, role_id: self.id
        if find_arr == nil
            puts "no actor has been hired for this role"
        else
            find_arr
        end

    end

    def understudy
        binding.pry
        find_arr = Audition.where(["hired = ? and role_id = ?", true, self.id]).second
        if find_arr == nil
            puts "no actor has been hired for understudy for this role"
        else
            find_arr
        end
    end

end