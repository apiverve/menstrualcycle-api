/**
 * Basic Example - Menstrual Cycle Calculator API
 *
 * This example demonstrates how to use the Menstrual Cycle Calculator API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const menstrualcycleAPI = require('../index.js');

// Initialize the API client
const api = new menstrualcycleAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  last_period: "2024-01-01",
  cycle_length: 28,
  period_length: 5,
  cycles: 3
};

// Make the API request using callback
console.log('Making request to Menstrual Cycle Calculator API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
