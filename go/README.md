# Menstrual Cycle Calculator API - Go Client

Menstrual Cycle Calculator predicts future menstrual cycles, fertile windows, and ovulation dates based on cycle history and patterns.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Go client for the [Menstrual Cycle Calculator API](https://apiverve.com/marketplace/menstrualcycle?utm_source=go&utm_medium=readme)

---

## Installation

```bash
go get github.com/apiverve/menstrualcycle-api/go
```

---

## Configuration

Before using the Menstrual Cycle Calculator API client, you need to obtain your API key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=go&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=go&utm_medium=readme)

The Menstrual Cycle Calculator API documentation is found here: [https://docs.apiverve.com/ref/menstrualcycle](https://docs.apiverve.com/ref/menstrualcycle?utm_source=go&utm_medium=readme)

---

## Usage

```go
package main

import (
    "fmt"
    "log"

    "github.com/apiverve/menstrualcycle-api/go"
)

func main() {
    // Create a new client
    client := menstrualcycle.NewClient("YOUR_API_KEY")

    // Set up parameters
    params := map[string]interface{}{
        "last_period": "2024-01-01",
        "cycle_length": 28,
        "period_length": 5,
        "cycles": 3
    }

    // Make the request
    response, err := client.Execute(params)
    if err != nil {
        log.Fatal(err)
    }

    fmt.Printf("Status: %s\n", response.Status)
    fmt.Printf("Data: %+v\n", response.Data)
}
```

---

## Example Response

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=go&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=go&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=go&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=go&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
