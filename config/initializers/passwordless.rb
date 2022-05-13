Passwordless.timeout_at = lambda { 1.hour.from_now } # How long until a magic link expires.
Passwordless.expires_at = lambda { 1.week.from_now } # How long until a passwordless session expires.
# Default redirection paths
Passwordless.success_redirect_path = '/' # When a user succeeds in logging in.
Passwordless.failure_redirect_path = '/' # When a a login is failed for any reason.
Passwordless.sign_out_redirect_path = '/' # When a user logs out.