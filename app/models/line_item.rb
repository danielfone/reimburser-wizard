class LineItem
  include ActiveModel::Model

  attr_accessor :detail, :code, :dept, :amount, :gst

  validates_presence_of :detail, :code, :dept
  validates_numericality_of :amount
end
