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

        <form class="login-form" action="/auth/signin" method="post">
          <div class="input-group">
            <div class="input-wrapper">
              <svg class="input-icon" width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
              </svg>
              <input class="input" type="text" name="username" placeholder="Username" required />
            </div>
          </div>
          
          <div class="input-group">
            <div class="input-wrapper">
              <svg class="input-icon" width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
              </svg>
              <input class="input" type="password" name="password" placeholder="Password" required />
            </div>
          </div>
          
          <div class="form-actions">
            <button type="submit" class="btn-primary">
              <span>Log In</span>
              <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
              </svg>
            </button>
          </div>
        </form>
      </div>
      
      <div class="login-footer">
        <div class="security-badge">
          <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
            <path fill-rule="evenodd" d="M8 1a3.5 3.5 0 0 0-3.5 3.5V6H3a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1h-1.5V4.5A3.5 3.5 0 0 0 8 1zM6.5 4.5a1.5 1.5 0 0 1 3 0V6h-3V4.5z"/>
          </svg>
          Secure Login
        </div>
      </div>
    </div>
  </div>
</@ui.page>
