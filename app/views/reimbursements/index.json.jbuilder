json.array!(@reimbursements) do |reimbursement|
  json.extract! reimbursement, :reference, :payee_id, :comments, :data
  json.url reimbursement_url(reimbursement, format: :json)
end
