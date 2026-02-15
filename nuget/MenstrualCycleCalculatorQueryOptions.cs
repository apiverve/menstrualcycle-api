using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.MenstrualCycleCalculator
{
    /// <summary>
    /// Query options for the Menstrual Cycle Calculator API
    /// </summary>
    public class MenstrualCycleCalculatorQueryOptions
    {
        /// <summary>
        /// First day of last menstrual period (YYYY-MM-DD)
        /// </summary>
        [JsonProperty("last_period")]
        public string Last_period { get; set; }

        /// <summary>
        /// Average cycle length in days
        /// </summary>
        [JsonProperty("cycle_length")]
        public string Cycle_length { get; set; }

        /// <summary>
        /// Average period duration in days
        /// </summary>
        [JsonProperty("period_length")]
        public string Period_length { get; set; }

        /// <summary>
        /// Number of future cycles to calculate
        /// </summary>
        [JsonProperty("cycles")]
        public string Cycles { get; set; }
    }
}
