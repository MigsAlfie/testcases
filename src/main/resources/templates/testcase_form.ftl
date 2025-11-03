<h2>
  Test Case Form
</h2>
<form action="/testcases" method="post">
  <input type="hidden" name="id" value="${testcase.id?if_exists}">
  Name:
  <input type="text" name="name" value="${testcase.name?if_exists}">
  <br/>
  Description:
  <input type="text" name="description" value="${testcase.description?if_exists}">
  <br/>
  Steps:
  <textarea name="testSteps">
    ${testcase.testSteps?if_exists}
  </textarea>
  <br/>
  Expected Results:
  <textarea name="expectedResults">
    ${testcase.expectedResults?if_exists}
  </textarea>
  <br/>
  <button type="submit">
    Save
  </button>
</form>
<a href="/testcases">
  Back
</a>
