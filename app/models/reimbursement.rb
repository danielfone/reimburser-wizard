class Reimbursement < ActiveRecord::Base
  belongs_to :payee, class_name: 'Employee'

  validates :payee_id, presence: true

  def line_items
    @line_items ||= []
  end

end
