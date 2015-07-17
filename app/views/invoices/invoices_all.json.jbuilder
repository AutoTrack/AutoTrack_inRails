json.array! @invoice do |invoice|
    json.id invoice.id
    json.invoice_url invoice.invoice_url
    json.invoice_status invoice.invoice_status
    json.business_users do
        json.partial! 'business_users/business_register', business_user: invoice.business_user
    end
end