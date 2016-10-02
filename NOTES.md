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


if (window.location.href === window.location.search) {
  window.location.search = window.location.search + '/news_source?utf8=✓&news=' + $('#news-refresh form #news').val();
} else {

  <%= form_for @post, html: { multipart: true } do |f| %>

    <%= f.label :tag_name %>
    <%= f.text_field :tag_name, list: "tags_autocomplete" %>
      <datalist id="tags_autocomplete">
      <%= Tag.all.each do |tag| %>
        <option value="<%= tag.name %>">
      <% end %>
      </datalist><br />
    <%= f.label :title %><br />
    <%= f.text_field :title %><br />
    <%= f.label :summary %><br />
    <%= f.text_area :summary %><br />
    <%= f.label :content %><br />
    <%= f.text_area :content %><br />
    <%= f.label :content_2 %><br />
    <%= f.text_area :content_2 %><br />
    <%= f.label :post_date %><br />
    <%= f.text_field :post_date %><br />

    <%= f.label "Attach Chart: " %><br />
    <%= f.file_field :image %>
    <%= f.submit %><br />
  <% end %>



  <div class="row mb48 mb-xs-0">
    <div class="col-sm-4 text-center">
        <div class="modal-container">
            <a class="btn btn-lg btn-modal" href="#">
                <i class="ti-text"></i> Basic Text</a>
                <div id="myModal" class="modal fade" role="dialog">
                  <div class="modal-dialog">
