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


--Button to Add more charts
--password update confirmation
--logo
--Ad showing
--Books for each product group

-Add STIRTS


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

<!-- from ApplicationController -->

before_filter :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  #This allows the attributes to be accessible at sign up. I had to add email and password after adding token.
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :stripe_card_token, :email, :password) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :stripe_card_token) }
end
