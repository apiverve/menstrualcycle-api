# Menstrual Cycle Calculator API - Ruby Gem

Menstrual Cycle Calculator is a period tracker API that predicts future menstrual cycles, fertile windows, and ovulation dates from the last period date and the average cycle and period length.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_menstrualcycle'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_menstrualcycle
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_menstrualcycle'

# Initialize the client
client = APIVerve::Menstrualcycle::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  last_period: "2024-01-01",
  cycle_length: 28,
  period_length: 5,
  cycles: 3
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ last_period: "2024-01-01", cycle_length: 28, period_length: 5, cycles: 3 })
  puts response["data"]
rescue APIVerve::Menstrualcycle::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Menstrualcycle::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Menstrualcycle::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

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
        "days_ago": 715
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
        "days_ago": 687
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
        "days_ago": 659
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/menstrualcycle?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/menstrualcycle?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/menstrualcycle?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
