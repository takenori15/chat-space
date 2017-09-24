if @new_message.present?
  json.array! @new_message do |message|
    json.id message.id
    json.user_name message.user.name
    json.text message.body
    json.image message.image
    json.time message.created_at
  end
end
