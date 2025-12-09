"""
Menstrual Cycle Calculator API - Basic Usage Example

This example demonstrates the basic usage of the Menstrual Cycle Calculator API.
API Documentation: https://docs.apiverve.com/ref/menstrualcycle
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/menstrualcycle'

def call_menstrualcycle_api():
    """
    Make a GET request to the Menstrual Cycle Calculator API
    """
    try:
        # Query parameters
        params &#x3D; {&#x27;last_period&#x27;: &#x27;2024-01-01&#x27;, &#x27;cycle_length&#x27;: 28, &#x27;period_length&#x27;: 5, &#x27;cycles&#x27;: 3}

        headers = {
            'x-api-key': API_KEY
        }

        response = requests.get(API_URL, headers=headers, params=params)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Menstrual Cycle Calculator API...\n')

    result = call_menstrualcycle_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
