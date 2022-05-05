Sentry.init do |config|
    config.dsn = 'https://bbb32e60c8fc418285cbdf24b8c39f91@o1233768.ingest.sentry.io/6382745'
    config.breadcrumbs_logger = [:sentry_logger, :http_logger]
  
    # To activate performance monitoring, set one of these options.
    # We recommend adjusting the value in production:
    config.traces_sample_rate = 0.5
    # or
    config.traces_sampler = lambda do |context|
      0.5
    end
end