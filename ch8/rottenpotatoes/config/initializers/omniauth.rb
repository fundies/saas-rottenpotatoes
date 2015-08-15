class Omniauth

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, "hwJuQFtN4Few0siGna8KkQ9ek", "x44IgellqrsJSjvw02TsgVCMIoB5aQ6m1ZBqaaXN3KDxEBrELd"
  end
end
