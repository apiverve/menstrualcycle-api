Menstrual Cycle Calculator API
============

Menstrual Cycle Calculator predicts future menstrual cycles, fertile windows, and ovulation dates based on cycle history and patterns.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Menstrual Cycle Calculator API](https://apiverve.com/marketplace/menstrualcycle?utm_source=pypi&utm_medium=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-menstrualcyclecalculator
```

Using `pip3`:

```bash
pip3 install apiverve-menstrualcyclecalculator
```

---

## Configuration

Before using the menstrualcycle API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_menstrualcyclecalculator.apiClient import MenstrualcycleAPIClient

# Initialize the client with your APIVerve API key
api = MenstrualcycleAPIClient("[YOUR_API_KEY]")

query = { "last_period": "2024-01-01", "cycle_length": 28, "period_length": 5, "cycles": 3 }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Menstrual Cycle Calculator API documentation is found here: [https://docs.apiverve.com/ref/menstrualcycle](https://docs.apiverve.com/ref/menstrualcycle?utm_source=pypi&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_menstrualcyclecalculator.apiClient import MenstrualcycleAPIClient

# Initialize the client with your APIVerve API key
api = MenstrualcycleAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "last_period": "2024-01-01", "cycle_length": 28, "period_length": 5, "cycles": 3 }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "last_period_date": "2024-01-01",
    "cycle_length": 28,
    "period_length": 5,
    "cycles_calculated": 3,
    "cycles": [
      {
        "cycle_number": 1,
        "period": {
          "start_date": "2024-01-01",
          "end_date": "2024-01-05",
          "duration_days": 5
        },
        "ovulation": {
          "date": "2024-01-15",
          "day_of_cycle": 14
        },
        "fertile_window": {
          "start_date": "2024-01-10",
          "end_date": "2024-01-15",
          "duration_days": 6
        },
        "pms_phase": {
          "start_date": "2023-12-21",
          "end_date": "2023-12-31"
        },
        "cycle_phases": {
          "menstrual": {
            "start": "2024-01-01",
            "end": "2024-01-05",
            "description": "Menstruation"
          },
          "follicular": {
            "start": "2024-01-06",
            "end": "2024-01-14",
            "description": "Follicular phase - preparing for ovulation"
          },
          "ovulation": {
            "date": "2024-01-15",
            "description": "Ovulation - most fertile day"
          },
          "luteal": {
            "start": "2024-01-16",
            "end": "2024-01-28",
            "description": "Luteal phase - preparing for next period"
          }
        },
        "status": "past",
        "days_until": null,
        "days_ago": 684
      },
      {
        "cycle_number": 2,
        "period": {
          "start_date": "2024-01-29",
          "end_date": "2024-02-02",
          "duration_days": 5
        },
        "ovulation": {
          "date": "2024-02-12",
          "day_of_cycle": 14
        },
        "fertile_window": {
          "start_date": "2024-02-07",
          "end_date": "2024-02-12",
          "duration_days": 6
        },
        "pms_phase": {
          "start_date": "2024-01-18",
          "end_date": "2024-01-28"
        },
        "cycle_phases": {
          "menstrual": {
            "start": "2024-01-29",
            "end": "2024-02-02",
            "description": "Menstruation"
          },
          "follicular": {
            "start": "2024-02-03",
            "end": "2024-02-11",
            "description": "Follicular phase - preparing for ovulation"
          },
          "ovulation": {
            "date": "2024-02-12",
            "description": "Ovulation - most fertile day"
          },
          "luteal": {
            "start": "2024-02-13",
            "end": "2024-02-25",
            "description": "Luteal phase - preparing for next period"
          }
        },
        "status": "past",
        "days_until": null,
        "days_ago": 656
      },
      {
        "cycle_number": 3,
        "period": {
          "start_date": "2024-02-26",
          "end_date": "2024-03-01",
          "duration_days": 5
        },
        "ovulation": {
          "date": "2024-03-11",
          "day_of_cycle": 14
        },
        "fertile_window": {
          "start_date": "2024-03-06",
          "end_date": "2024-03-11",
          "duration_days": 6
        },
        "pms_phase": {
          "start_date": "2024-02-15",
          "end_date": "2024-02-25"
        },
        "cycle_phases": {
          "menstrual": {
            "start": "2024-02-26",
            "end": "2024-03-01",
            "description": "Menstruation"
          },
          "follicular": {
            "start": "2024-03-02",
            "end": "2024-03-10",
            "description": "Follicular phase - preparing for ovulation"
          },
          "ovulation": {
            "date": "2024-03-11",
            "description": "Ovulation - most fertile day"
          },
          "luteal": {
            "start": "2024-03-12",
            "end": "2024-03-24",
            "description": "Luteal phase - preparing for next period"
          }
        },
        "status": "past",
        "days_until": null,
        "days_ago": 628
      }
    ],
    "current_status": {
      "phase": "Unknown",
      "description": "",
      "next_period": null,
      "days_until_next_period": null
    },
    "averages": {
      "cycle_length": 28,
      "period_duration": 5,
      "days_between_periods": 28
    },
    "disclaimer": "This calculator provides estimates only. Actual cycles may vary. Consult a healthcare provider for medical advice."
  }
}
```

---

## Error Handling

The API client provides comprehensive error handling through the `MenstrualcycleAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_menstrualcyclecalculator.apiClient import MenstrualcycleAPIClient, MenstrualcycleAPIClientError

api = MenstrualcycleAPIClient("[YOUR_API_KEY]")

query = { "last_period": "2024-01-01", "cycle_length": 28, "period_length": 5, "cycles": 3 }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except MenstrualcycleAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_menstrualcyclecalculator.apiClient import MenstrualcycleAPIClient, MenstrualcycleAPIClientError

api = MenstrualcycleAPIClient("[YOUR_API_KEY]")

query = { "last_period": "2024-01-01", "cycle_length": 28, "period_length": 5, "cycles": 3 }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except MenstrualcycleAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_menstrualcyclecalculator.apiClient import MenstrualcycleAPIClient, MenstrualcycleAPIClientError

query = { "last_period": "2024-01-01", "cycle_length": 28, "period_length": 5, "cycles": 3 }

# Using context manager ensures proper cleanup
with MenstrualcycleAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except MenstrualcycleAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_menstrualcyclecalculator.apiClient import MenstrualcycleAPIClient

# Enable debug mode
api = MenstrualcycleAPIClient("[YOUR_API_KEY]", debug=True)

query = { "last_period": "2024-01-01", "cycle_length": 28, "period_length": 5, "cycles": 3 }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_menstrualcyclecalculator.apiClient import MenstrualcycleAPIClient

api = MenstrualcycleAPIClient("[YOUR_API_KEY]")

try:
    query = { "last_period": "2024-01-01", "cycle_length": 28, "period_length": 5, "cycles": 3 }
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
