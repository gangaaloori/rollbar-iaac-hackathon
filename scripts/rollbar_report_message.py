#!/usr/bin/env python3
import rollbar
import sys

rollbar.init(
  access_token=''.join(sys.argv[1]),
  environment=''.join(sys.argv[2])
)
rollbar.report_message('This is a test message from Rollbar', 'error')
