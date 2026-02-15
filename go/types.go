// Package menstrualcycle provides a Go client for the Menstrual Cycle Calculator API.
//
// For more information, visit: https://apiverve.com/marketplace/menstrualcycle?utm_source=go&utm_medium=readme
package menstrualcycle

import (
	"fmt"
	"reflect"
	"regexp"
	"strings"
)

// ValidationRule defines validation constraints for a parameter.
type ValidationRule struct {
	Type      string
	Required  bool
	Min       *float64
	Max       *float64
	MinLength *int
	MaxLength *int
	Format    string
	Enum      []string
}

// ValidationError represents a parameter validation error.
type ValidationError struct {
	Errors []string
}

func (e *ValidationError) Error() string {
	return "Validation failed: " + strings.Join(e.Errors, "; ")
}

// Helper functions for pointers
func float64Ptr(v float64) *float64 { return &v }
func intPtr(v int) *int             { return &v }

// Format validation patterns
var formatPatterns = map[string]*regexp.Regexp{
	"email":    regexp.MustCompile(`^[^\s@]+@[^\s@]+\.[^\s@]+$`),
	"url":      regexp.MustCompile(`^https?://.+`),
	"ip":       regexp.MustCompile(`^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$`),
	"date":     regexp.MustCompile(`^\d{4}-\d{2}-\d{2}$`),
	"hexColor": regexp.MustCompile(`^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$`),
}

// Request contains the parameters for the Menstrual Cycle Calculator API.
//
// Parameters:
//   - last_period (required): string - First day of last menstrual period (YYYY-MM-DD) [format: date]
//   - cycle_length: integer - Average cycle length in days [min: 21, max: 35]
//   - period_length: integer - Average period duration in days [min: 2, max: 10]
//   - cycles: integer - Number of future cycles to calculate [min: 1, max: 12]
type Request struct {
	LastPeriod string `json:"last_period"` // Required
	CycleLength int `json:"cycle_length,omitempty"` // Optional
	PeriodLength int `json:"period_length,omitempty"` // Optional
	Cycles int `json:"cycles,omitempty"` // Optional
}

// ToQueryParams converts the request struct to a map of query parameters.
// Only non-zero values are included.
func (r *Request) ToQueryParams() map[string]string {
	params := make(map[string]string)
	if r == nil {
		return params
	}

	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		// Get the json tag for the field name
		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		// Handle tags like `json:"name,omitempty"`
		jsonName := strings.Split(jsonTag, ",")[0]
		if jsonName == "-" {
			continue
		}

		// Skip zero values
		if field.IsZero() {
			continue
		}

		// Convert to string
		params[jsonName] = fmt.Sprintf("%v", field.Interface())
	}

	return params
}

// Validate checks the request parameters against validation rules.
// Returns a ValidationError if validation fails, nil otherwise.
func (r *Request) Validate() error {
	rules := map[string]ValidationRule{
		"last_period": {Type: "string", Required: true, Format: "date"},
		"cycle_length": {Type: "integer", Required: false, Min: float64Ptr(21), Max: float64Ptr(35)},
		"period_length": {Type: "integer", Required: false, Min: float64Ptr(2), Max: float64Ptr(10)},
		"cycles": {Type: "integer", Required: false, Min: float64Ptr(1), Max: float64Ptr(12)},
	}

	if len(rules) == 0 {
		return nil
	}

	var errors []string
	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		jsonName := strings.Split(jsonTag, ",")[0]

		rule, exists := rules[jsonName]
		if !exists {
			continue
		}

		// Check required
		if rule.Required && field.IsZero() {
			errors = append(errors, fmt.Sprintf("Required parameter [%s] is missing", jsonName))
			continue
		}

		if field.IsZero() {
			continue
		}

		// Type-specific validation
		switch rule.Type {
		case "integer", "number":
			var numVal float64
			switch field.Kind() {
			case reflect.Int, reflect.Int64:
				numVal = float64(field.Int())
			case reflect.Float64:
				numVal = field.Float()
			}
			if rule.Min != nil && numVal < *rule.Min {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %v", jsonName, *rule.Min))
			}
			if rule.Max != nil && numVal > *rule.Max {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %v", jsonName, *rule.Max))
			}

		case "string":
			strVal := field.String()
			if rule.MinLength != nil && len(strVal) < *rule.MinLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %d characters", jsonName, *rule.MinLength))
			}
			if rule.MaxLength != nil && len(strVal) > *rule.MaxLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %d characters", jsonName, *rule.MaxLength))
			}
			if rule.Format != "" {
				if pattern, ok := formatPatterns[rule.Format]; ok {
					if !pattern.MatchString(strVal) {
						errors = append(errors, fmt.Sprintf("Parameter [%s] must be a valid %s", jsonName, rule.Format))
					}
				}
			}
		}

		// Enum validation
		if len(rule.Enum) > 0 {
			strVal := fmt.Sprintf("%v", field.Interface())
			found := false
			for _, enumVal := range rule.Enum {
				if strVal == enumVal {
					found = true
					break
				}
			}
			if !found {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be one of: %s", jsonName, strings.Join(rule.Enum, ", ")))
			}
		}
	}

	if len(errors) > 0 {
		return &ValidationError{Errors: errors}
	}
	return nil
}

// ResponseData contains the data returned by the Menstrual Cycle Calculator API.
type ResponseData struct {
	LastPeriodDate string `json:"last_period_date"`
	CycleLength int `json:"cycle_length"`
	PeriodLength int `json:"period_length"`
	CyclesCalculated int `json:"cycles_calculated"`
	Cycles []CyclesItem `json:"cycles"`
	CurrentStatus CurrentStatusData `json:"current_status"`
	Averages AveragesData `json:"averages"`
	Disclaimer string `json:"disclaimer"`
}

// CyclesItem represents an item in the Cycles array.
type CyclesItem struct {
	CycleNumber int `json:"cycle_number"`
	Period PeriodData `json:"period"`
	Ovulation OvulationData `json:"ovulation"`
	FertileWindow FertileWindowData `json:"fertile_window"`
	PmsPhase PmsPhaseData `json:"pms_phase"`
	CyclePhases CyclePhasesData `json:"cycle_phases"`
	Status string `json:"status"`
	DaysUntil interface{} `json:"days_until"`
	DaysAgo int `json:"days_ago"`
}

// PeriodData represents the period object.
type PeriodData struct {
	StartDate string `json:"start_date"`
	EndDate string `json:"end_date"`
	DurationDays int `json:"duration_days"`
}

// OvulationData represents the ovulation object.
type OvulationData struct {
	Date string `json:"date"`
	DayOfCycle int `json:"day_of_cycle"`
}

// FertileWindowData represents the fertile_window object.
type FertileWindowData struct {
	StartDate string `json:"start_date"`
	EndDate string `json:"end_date"`
	DurationDays int `json:"duration_days"`
}

// PmsPhaseData represents the pms_phase object.
type PmsPhaseData struct {
	StartDate string `json:"start_date"`
	EndDate string `json:"end_date"`
}

// CyclePhasesData represents the cycle_phases object.
type CyclePhasesData struct {
	Menstrual MenstrualData `json:"menstrual"`
	Follicular FollicularData `json:"follicular"`
	Ovulation OvulationData `json:"ovulation"`
	Luteal LutealData `json:"luteal"`
}

// MenstrualData represents the menstrual object.
type MenstrualData struct {
	Start string `json:"start"`
	End string `json:"end"`
	Description string `json:"description"`
}

// FollicularData represents the follicular object.
type FollicularData struct {
	Start string `json:"start"`
	End string `json:"end"`
	Description string `json:"description"`
}

// OvulationData represents the ovulation object.
type OvulationData struct {
	Date string `json:"date"`
	Description string `json:"description"`
}

// LutealData represents the luteal object.
type LutealData struct {
	Start string `json:"start"`
	End string `json:"end"`
	Description string `json:"description"`
}

// CurrentStatusData represents the current_status object.
type CurrentStatusData struct {
	Phase string `json:"phase"`
	Description string `json:"description"`
	NextPeriod interface{} `json:"next_period"`
	DaysUntilNextPeriod interface{} `json:"days_until_next_period"`
}

// AveragesData represents the averages object.
type AveragesData struct {
	CycleLength int `json:"cycle_length"`
	PeriodDuration int `json:"period_duration"`
	DaysBetweenPeriods int `json:"days_between_periods"`
}
