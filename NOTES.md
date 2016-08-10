current price on positions index page
status on positions index page


Total P/L on home page

Need authentication

if is_logged_in? can delete trades if they are yours

can delete posts if they are yours

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

class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave


  process :convert => 'png'
  process :tags => ['post_picture']



  version :thumbnail do
    resize_to_fit(50, 50)
  end



end

<% @position.trade_details.each do |trade| %>
  <li><%= "#{trade.direction} #{trade.size} #{trade.product} #{trade.price} #{trade.trade_date} current_price: #{trade.current_price.to_f}" %></li>
<% end %>


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
