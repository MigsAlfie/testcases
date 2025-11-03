<h2>
  Test Cases
</h2>
<a href="/testcases/new">
  Add New Test Case
</a>
<table border="1">
  <tr>
    <th>
      ID
    </th>
    <th>
      Name
    </th>
    <th>
      Description
    </th>
    <th>
      Actions
    </th>
  </tr>
  <#list testcases as tc>
    <tr>
      <td>
        ${tc.id}
      </td>
      <td>
        ${tc.name}
      </td>
      <td>
        ${tc.description}
      </td>
      <td>
        <a href="/testcases/edit/${tc.id}">
          Edit
        </a>
        <a href="/testcases/delete/${tc.id}">
          Delete
        </a>
      </td>
    </tr>
  </#list>
</table>
<a href="/">
  Back
</a>
