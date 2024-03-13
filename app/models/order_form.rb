class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number

  def item_price
    Item.find(item_id).price
  end

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  end
  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number, order_id: order.id)
  end
end