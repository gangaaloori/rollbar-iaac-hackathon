#!/usr/bin/env python3
import rollbar
import sys

print("Command line args: ", sys.argv)

rollbar.init(
  access_token=sys.argv[2],
  environment=sys.argv[1],
  code_version='1.0'
)
rollbar.report_message('Rollbar is configured correctly', 'error')