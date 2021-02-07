class Chore < ApplicationRecord
    #relationships (added in lab)
    belongs_to :child
    belongs_to :task
    
    #scopes
    scope :by_task, -> {joins(:task).order('name')}
    scope :chronological, -> {order(:due_on)}
    scope :pending, -> {where(completed: false)}
    scope :done, -> {where(completed: true)}
    scope :upcoming, -> {where('due_on >= ?', Date.today)}
    scope :past, -> {where('due_on < ?', Date.today)}

    #validations
    validates_date :due_on

    #method
    def status
        if self.completed
            return "Completed"
        else
            return "Pending"
        end
    end
end
