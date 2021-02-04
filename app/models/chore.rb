class Chore < ApplicationRecord
	belongs_to :child
	belongs_to :task

	#Validations
	validates_date :due_on

	#Scope
	scope :by_task, -> { joins(:task).order('name') }
	scope :chronological, -> { order(:due_on, :completed)}
	scope :alphabetical,    -> { order('name') }
	scope :pending,         -> {where('completed = ?', false)}
	scope :done,            -> {where('completed = ?', true)}
	scope :upcoming, -> {where("due_on >= ?", Date.today)}
	scope :past, -> {where("due_on < ?", Date.today)}

	def status
	if completed == true 
		status = "Completed"
	else status = "Pending"
	end
end

end
