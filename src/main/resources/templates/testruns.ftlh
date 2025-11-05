<#import "layout.ftlh" as ui>
<@ui.page title="Test Runs" active="testruns">
<link rel="stylesheet" href="/css/testruns.css">

  <div class="toolbar">
    <div class="h1">Run Test Case</div>
    <a class="btn secondary" href="/testcases">View Test Cases</a>
  </div>

  <div class="grid cols-2">
    <div>
      <form class="form form-container wide-form" action="/testruns" method="post">
        <div>
          <label class="subtitle">Select Test Case</label>
          <select class="select" name="testCaseId" id="testCaseSelect">
            <#list testcases as tc>
              <option value="${tc.id}" 
                      data-module="${tc.module!""}"
                      data-description="${tc.description!""}"
                      data-steps="${(tc.testSteps!"")?replace('\r\n','\n')?replace('\n','\\n')}"
                      data-expected="${(tc.expectedResults!"")?replace('\r\n','\n')?replace('\n','\\n')}"
                      <#if selectedTestCase?? && selectedTestCase == tc.id>selected</#if>>${tc.name}</option>
            </#list>
          </select>
        </div>

        <#-- Test Case Details Display -->
        <div id="testCaseDetails" class="test-case-details" style="margin: 1.5rem 0; padding: 1rem; border: 1px solid #ddd; border-radius: 4px; background: #f9f9f9;">
          <div class="details-content">
            <div style="margin-bottom: 0.75rem;">
              <strong style="color: #555;">Module:</strong>
              <span id="detailModule" style="margin-left: 0.5rem;">—</span>
            </div>
            <div style="margin-bottom: 0.75rem;">
              <strong style="color: #555;">Description:</strong>
              <p id="detailDescription" style="margin: 0.25rem 0 0 0; color: #333;">—</p>
            </div>
            <div style="margin-bottom: 0.75rem;">
              <strong style="color: #555;">Steps:</strong>
              <pre id="detailSteps" style="margin: 0.25rem 0 0 0; padding: 0.5rem; background: white; border: 1px solid #e0e0e0; border-radius: 3px; white-space: pre-wrap; font-size: 0.9em; color: #333;">—</pre>
            </div>
            <div>
              <strong style="color: #555;">Expected Result:</strong>
              <pre id="detailExpected" style="margin: 0.25rem 0 0 0; padding: 0.5rem; background: white; border: 1px solid #e0e0e0; border-radius: 3px; white-space: pre-wrap; font-size: 0.9em; color: #333;">—</pre>
            </div>
          </div>
        </div>
        
        <div>
          <label class="subtitle">Result</label>
          <select class="select" name="status">
            <#list statuses as st>
              <#assign lbl = (st=="NOT_TESTED")?then("Not yet tested", st?capitalize)>
              <option value="${st}" <#if selectedStatus?? && selectedStatus?string == st?string>selected</#if>>${lbl}</option>
            </#list>
          </select>
        </div>
        
        <#-- Hidden field to preserve filter when submitting form -->
        <#if filterStatus??>
          <input type="hidden" name="filterStatus" value="${filterStatus}">
        </#if>
        
        <div class="actions">
          <button class="btn" type="submit">Save Result</button>
        </div>
      </form>
    </div>

    <div>
      <#-- Filter Section -->
      <div style="margin-bottom: 1rem; display: flex; align-items: center; gap: 1rem;">
        <label class="subtitle" style="margin: 0;">Filter by Status:</label>
        <form method="get" action="/testruns" style="display: flex; gap: 0.5rem; align-items: center;">
          <select class="select" name="filterStatus" onchange="this.form.submit()" style="width: auto;">
            <option value="">All Results</option>
            <#list statuses as st>
              <#assign lbl = (st=="NOT_TESTED")?then("Not yet tested", st?capitalize)>
              <option value="${st}" <#if filterStatus?? && filterStatus?string == st?string>selected</#if>>${lbl}</option>
            </#list>
          </select>
          
          <#-- Preserve form selections when filtering -->
          <#if selectedTestCase??>
            <input type="hidden" name="selectedTestCase" value="${selectedTestCase}">
          </#if>
          <#if selectedStatus??>
            <input type="hidden" name="selectedStatus" value="${selectedStatus}">
          </#if>
          
          <#if filterStatus??>
            <a href="/testruns<#if selectedTestCase?? || selectedStatus??>?<#if selectedTestCase??>selectedTestCase=${selectedTestCase}</#if><#if selectedTestCase?? && selectedStatus??>&</#if><#if selectedStatus??>selectedStatus=${selectedStatus}</#if></#if>" class="btn secondary" style="padding: 0.5rem 1rem;">Clear Filter</a>
          </#if>
        </form>
      </div>

      <table class="table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Test Case</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <#if testruns?has_content>
            <#list testruns as run>
              <tr>
                <td>${run.id}</td>
                <td>${run.testCase.name}</td>
                <td>
                  <#assign slabel = (run.status?string=="NOT_TESTED")?then("Not yet tested", run.status?string?capitalize)>
                  <span class="badge <#if run.status?string=="PASSED">success<#elseif run.status?string=="FAILED">danger<#elseif run.status?string=="SKIPPED">warn</#if>">
                    ${slabel}
                  </span>
                </td>
              </tr>
            </#list>
          <#else>
            <tr>
              <td colspan="3" style="text-align: center; padding: 2rem; color: #666;">
                <#if filterStatus??>
                  No test runs found with status: <strong>${(filterStatus=="NOT_TESTED")?then("Not yet tested", filterStatus?capitalize)}</strong>
                <#else>
                  No test runs available
                </#if>
              </td>
            </tr>
          </#if>
        </tbody>
      </table>
    </div>
  </div>

  <script>
    (function(){
      function decode(text){
        try { return (text || '').replace(/\\n/g, '\n'); } catch(e){ return text || ''; }
      }

      function updateTestCaseDetails(){
        var select = document.getElementById('testCaseSelect');
        if(!select) return;
        
        var option = select.options[select.selectedIndex];
        if(!option) return;

        var module = option.getAttribute('data-module') || '—';
        var description = option.getAttribute('data-description') || '—';
        var steps = decode(option.getAttribute('data-steps') || '—');
        var expected = decode(option.getAttribute('data-expected') || '—');

        var moduleEl = document.getElementById('detailModule');
        var descEl = document.getElementById('detailDescription');
        var stepsEl = document.getElementById('detailSteps');
        var expectedEl = document.getElementById('detailExpected');

        if(moduleEl) moduleEl.textContent = module;
        if(descEl) descEl.textContent = description;
        if(stepsEl) stepsEl.textContent = steps;
        if(expectedEl) expectedEl.textContent = expected;
      }

      // Update details on page load
      updateTestCaseDetails();

      // Update details when selection changes
      var select = document.getElementById('testCaseSelect');
      if(select){
        select.addEventListener('change', updateTestCaseDetails);
      }
    })();
  </script>
</@ui.page>