"""
This module contains the test cases for the main application.
"""

import unittest
from app.main import app


class BasicTestCase(unittest.TestCase):
    """Basic test cases."""

    def test_home(self):
        """Test the home page."""
        tester = app.test_client(self)
        response = tester.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data, b'Hello, World!')


if __name__ == '__main__':
    unittest.main()

