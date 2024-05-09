import unittest2
import httpclient
from ../src/services/httpcli import makeGetRequest

suite "Test HTTP Client serivice":
    test "Make GET request":
        check: makeGetRequest("https://api.sampleapis.com/beers/ale").code == Http200