<h2>
  Test Runs
</h2>
<form action="/testruns" method="post">
  <select name="testCaseId">
    <#list testcases as tc>
      <option value="${tc.id}">
        ${tc.name}
      </option>
    </#list>
  </select>
  <select name="status">
    <#list statuses as st>
      <option value="${st}">
        ${st}
      </option>
    </#list>
  </select>
  <button type="submit">
    Add Run
  </button>
</form>
<table border="1">
  <tr>
    <th>
      ID
    </th>
    <th>
      Test Case
    </th>
    <th>
      Status
    </th>
  </tr>
  <#list testruns as run>
    <tr>
      <td>
        ${run.id}
      </td>
      <td>
        ${run.testCase.name}
      </td>
      <td>
        ${run.status}
      </td>
    </tr>
  </#list>
</table>
<a href="/">
  Back
</a>
