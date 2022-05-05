Sentry.init do |config|
    config.dsn = 'https://bbb32e60c8fc418285cbdf24b8c39f91@o1233768.ingest.sentry.io/6382745'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # Set tracesSampleRate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
end