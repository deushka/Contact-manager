json.extract! contact, :id, :name, :surname, :email, :phone, :user_id, :optional, :created_at, :updated_at
json.url contact_url(contact, format: :json)
