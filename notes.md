<% if task.completed %>
  <h5 style="text-decoration: line-through;"><%= task.task_name%></h5>
  <br>
<% else %>
 <! is it necessary to assign name = "task.task_name" ? -->
  <!-- <h5>Task: <input type="string" name="project[task_ids][]" value="<%= task.id%>"></h5> -->
<!-- <% end %>

<!-- why is the textarea being erased when hitting return -->


<!-- <h4>Task: <input type="string" name="project[tasks][]" value="<%= task.task_name%>"></input></h4>
<!--  -->
<label>Description: </label>
<!-<input type="textarea" name="description" value="<%= task.description %>"<br><br>
<textarea id="description" cols="90" rows="1" ><%=task.description unless task.description.nil?%></textarea>
<br>
<label>Start Date: </label>
<input type="date" name="start_date" value="<%= task.start_date%>">
<label>End Date: </label>
<input type="date" name="end_date" value="<%= task.end_date%>">
<label>Completed : </label>
<input type="boolean" name="completed" value="<%= task.completed%>">
<br><br>
<% end %>
<input type="submit" value="Save Changes">
<br><br> -->
<!-- ********* -->
