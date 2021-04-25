##NEW(get) >> CREATE(post)
CONTROLLER
def new
  @student = Student.new
end


def create
  @author = Author.new(author_params)
    if @author.save
  redirect_to author_path(@author)
    else
      render :new
    end
end
# def create
#   @student = Student.new(student_params) 
#   @student.save
#   redirect_to student_path(@student)
# end

VIEW :: NEW.html.erb
FORM_FOR:
<%= form_for(@cat) do |f| %>
 <%= f.label :name %>
 <%= f.text_field :name %>
 <%= f.label :age %>
 <%= f.number_field :age %>
 <%= f.submit %>
<% end %> 


# def new
#   @coupon = Coupon.new  #need to supply form_for with an object to get filled in.
# end

# def create
#     @coupon = Coupon.new
#     @coupon[:coupon_code] =  params[:coupon][:coupon_code]
#     @coupon[:store] = params[:coupon][:store]
#     @coupon.save
#     redirect_to coupon_path(@coupon)
#   end


FORM_TAG: 
<h2>Coupon Form</h2>
<%= form_tag coupons_path do %>

<p><%= label_tag(:coupon_code) %>
<%= text_field_tag :"coupon[coupon_code]" %>
</p> <p>
<%= label_tag(:store) %>
<%= text_field_tag :"coupon[store]" %>
</p>
<%= submit_tag "Submit Coupon" %>

<% end %>