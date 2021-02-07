class Child < ApplicationRecord
    #relationships
    has_many :chores
    has_many :tasks, through: :chores

    #validations
    validates_presence_of  :first_name, :last_name
    #scopes
    scope :alphabetical, -> {order(last_name: :asc, first_name: :asc)} #check this syntax
    scope :active, -> {where(active: true)}

    

    #methods
    def name
        first_name + " " + last_name
    end

    def points_earned
        self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
    end 
end
