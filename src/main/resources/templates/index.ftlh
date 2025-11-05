<#import "layout.ftlh" as ui>
<@ui.page title="checkmate" showSidebar=false>
  <div class="auth">
    <div class="login-container">
      <div class="login-card card">
        <div class="login-header">
          <div class="brand-logo">
            <div class="logo-icon">
              <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
                <rect width="32" height="32" rx="8" fill="var(--brand)"/>
                <path d="M8 16L14 22L24 10" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </div>
            <div class="brand-text">
              <div class="h1">checkmate</div>
              <div class="brand-tagline">Test Case Management</div>
            </div>
          </div>
          <p class="subtitle">Log in to manage Test Cases and Runs</p>
        </div>

        <#if errorMessage??>
          <div class="error-alert">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
            </svg>
            ${errorMessage}
          </div>
        </#if>

        <#if errorMessage??>
          <p class="error" style="color: red; margin-bottom: 10px;">${errorMessage}</p>
        </#if>

        <form class="form mt-24" action="/auth/signin" method="post">
          <input class="input" type="text" name="username" placeholder="Username" required />
          <input class="input" type="password" name="password" placeholder="Password" required />
          <div class="actions">
            <button type="submit" class="btn w-100">Log in</button>
          </div>
        </form>

      <p class="footer-note mt-12">Don't have an account? <a class="link" href="/dashboard">Continue as guest</a></p>
    </div>
  </div>
</@ui.page>
