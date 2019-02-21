# W7D4 - Lecture

- Rails: view and route helpers

  - Store logic you want to reuse
  - Simplify the logic in your views

- Partials

## Review MVC

## Helpers

- Helpful methods that creates reusable piece of code

- Asset helpers
- Route helpers
- Views helpers
- Custom Helpers

### Asset Helps

- stylesheet_link_tag
- javascript_include_tag

### Route helpers

- Used any of prefixes when doing `bin/rake routes`
- Add path to the prefix ex.: products_path

- This will output `/products/1`

```ruby
item = Product.first
product_path(item)
```

### Views helpers

- link_to
- button_tag
- image_tag
- form_tag
- etc.

- use the **web console** in the views (rails console in the view)
- add the web console underneath **yield** in layout

#### Link_to

`link_to "my link","http://www.mylink.com"`

- Active Record can read an object to extract the path

```ruby
item = Product.first
link_to item.name, item
```

- We can also use a route helper to create the link

```ruby
item = Product.first
link_to item.name, product_path(item)
```

- You can use a block for the `link_to`
- ex.: \_product.html.erb

- You cannot use link_to in a controller, because it will output html
- But you can use `redirect_to root_path` for example

#### image_tag

- this will output `<img src="/uploads/product/image/1/apparel1.jpg" alt="Apparel1" />`

```ruby
item = Product.first
image_tag item.image
```

#### form helpers

- utility to create your forms

```ruby
<%= form_for @quote do |form| %>
  <% if quote.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(quote.errors.count, "error") %> prohibited this quote from being saved:</h2>

      <ul>
      <% quote.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= form.label :content %>
    <%= form.text_field :content %>
  </div>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>

```

### Custom Helpers

- Take some complexity out of the view

```ruby
  module ApplicationHelper
    def user_email(user)
      if user && user.email.present?
        user.email
      else
        "no email present"
      end
    end
  end
```

```ruby
def fancy_price(product)
    if product.price > 1000
      "#{product.price}??? Hella expensive!"
    else
      "#{product.price} is kinda reasonable."
    end
  end
```

## Partials

- Partials allows you to dry up your code in your views
- Reuse parts of HTML/erb content
- We can pass local variables into the partial
- Use the render method within the view
- Partials are very useful in rendering collections

- partial syntax

`<%= render partial: "partial name", locals: {some_variable: @some_variable} %>`

## Demo

- We used the Rails command-line to generate a new app
- We generated the model and the controller
- We did create the views manually and used some of the helpers

To start the quotes app:

- bundle install
- rails s -b 0.0.0.0

## References

- [Layouts and Rendering in Rails](https://guides.rubyonrails.org/layouts_and_rendering.html)

-[The Complete List of Ruby on Rails Helpers](https://jasoncharnes.com/rails-helpers/)
