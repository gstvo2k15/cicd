import sys
import os
import unittest

# Asegúrate de que el directorio 'app/python' esté en sys.path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from main import app

class TestMain(unittest.TestCase):
    def test_hello(self):
        tester = app.test_client(self)
        response = tester.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data, b'Hello, World!')

if __name__ == '__main__':
    unittest.main()
