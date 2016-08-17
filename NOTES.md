1. Login via Twitter
DONE 2. Comments join table
DONE 3. Tags-custom association methods
DONE 4. Validations

5. Need Terms of service and privacy policy URL's
 -static pages
 -add links to footer

-making Products uppercase is talked about in
ActiveRecord Lifecycle methods

Total P/L on home page

Flexible order for posts
-searchable by tag
DONE -summary for list
DONE -be able to add picture files to posts


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


<!-- <%= form_tag("/posts", method: "get") do %>
  <p>Filter by topic: <%= select_tag "tag", options_from_collection_for_select(@tags, "id", "name"), include_blank: true %> <%= submit_tag "Filter" %></p>
<% end %> -->
