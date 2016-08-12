1. Login via Twitter
2. Comments join table
3. Validations


-making Porducts uppercase is talked about in
ActiveRecord Lifecycle methods

Total P/L on home page

Flexible order for posts
-searchable
-summary for list
-be able to add picture files to posts


class User < ActiveRecord::Base
  has_many :posts
  has_many :trades
  accepts_nested_attributes_for :trades
  accepts_nested_attributes_for :posts
  validates :username, :email, :password, presence: true

  def trade_count
    self.trades.count
  end
end

POSITIONS index

<% @positions.each do |position| %>
<tr>
  <td><%= position.id %>. </td>
  <td><% if position.direction.downcase == "buy" %>
        Long
      <% elsif position.direction.downcase == "sell" %>
        Short
      <% end %> </td>
  <td><%=position.size %> </td>
  <td><%= position.product %> </td>
  <td><%= position.price %> </td>
  <td><%= position.position_date %> </td>
  <td><%= position.current_price %> </td>
  <td><%= position.status %> </td>
</tr>
  <% end %>
<br />

"/users/#{@user.id}/edit_rights"
