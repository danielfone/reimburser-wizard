class Reimbursement < ActiveRecord::Base
  belongs_to :payee, class_name: 'Employee'

  store :data, coder: JSON
  store_accessor :data, :line_items_attributes

  validates :payee_id, presence: true
  validate :check_line_items

  def line_items
    @line_items ||= if line_items_attributes
      line_items_attributes.map { |attrs| LineItem.new attrs }
    else
      []
    end
  end

  def line_items_attributes=(data)
    super data.values.reject { |attrs| attrs['detail'].blank? }
  end

private

  def check_line_items
    line_items.each_with_index do |li, i|
      errors.add "Line Item #{i+1}:", li.errors.full_messages.to_sentence unless li.valid?
    end    
  end

end
