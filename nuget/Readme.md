MenstrualCycleCalculator API
============

Menstrual Cycle Calculator predicts future menstrual cycles, fertile windows, and ovulation dates based on cycle history and patterns.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a .NET Wrapper for the [MenstrualCycleCalculator API](https://apiverve.com/marketplace/menstrualcycle?utm_source=nuget&utm_medium=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.MenstrualCycleCalculator
```

Using the Package Manager:
```
nuget install APIVerve.API.MenstrualCycleCalculator
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.MenstrualCycleCalculator
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.MenstrualCycleCalculator"
5. Click on the APIVerve.API.MenstrualCycleCalculator package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the menstrualcycle API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The MenstrualCycleCalculator API documentation is found here: [https://docs.apiverve.com/ref/menstrualcycle](https://docs.apiverve.com/ref/menstrualcycle?utm_source=nuget&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
MenstrualCycleCalculator API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new QueryOptions {
    last_period = "2024-01-01",
    cycle_length = 28,
    period_length = 5,
    cycles = 3
};

using (var apiClient = new MenstrualCycleCalculatorAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
