// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     MenstrualCycleCalculatorData data = Converter.fromJsonString(jsonString);

package com.apiverve.menstrualcycle.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static MenstrualCycleCalculatorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(MenstrualCycleCalculatorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(MenstrualCycleCalculatorData.class);
        writer = mapper.writerFor(MenstrualCycleCalculatorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// MenstrualCycleCalculatorData.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class MenstrualCycleCalculatorData {
    private LocalDate lastPeriodDate;
    private long cycleLength;
    private long periodLength;
    private long cyclesCalculated;
    private Cycle[] cycles;
    private CurrentStatus currentStatus;
    private Averages averages;
    private String disclaimer;

    @JsonProperty("last_period_date")
    public LocalDate getLastPeriodDate() { return lastPeriodDate; }
    @JsonProperty("last_period_date")
    public void setLastPeriodDate(LocalDate value) { this.lastPeriodDate = value; }

    @JsonProperty("cycle_length")
    public long getCycleLength() { return cycleLength; }
    @JsonProperty("cycle_length")
    public void setCycleLength(long value) { this.cycleLength = value; }

    @JsonProperty("period_length")
    public long getPeriodLength() { return periodLength; }
    @JsonProperty("period_length")
    public void setPeriodLength(long value) { this.periodLength = value; }

    @JsonProperty("cycles_calculated")
    public long getCyclesCalculated() { return cyclesCalculated; }
    @JsonProperty("cycles_calculated")
    public void setCyclesCalculated(long value) { this.cyclesCalculated = value; }

    @JsonProperty("cycles")
    public Cycle[] getCycles() { return cycles; }
    @JsonProperty("cycles")
    public void setCycles(Cycle[] value) { this.cycles = value; }

    @JsonProperty("current_status")
    public CurrentStatus getCurrentStatus() { return currentStatus; }
    @JsonProperty("current_status")
    public void setCurrentStatus(CurrentStatus value) { this.currentStatus = value; }

    @JsonProperty("averages")
    public Averages getAverages() { return averages; }
    @JsonProperty("averages")
    public void setAverages(Averages value) { this.averages = value; }

    @JsonProperty("disclaimer")
    public String getDisclaimer() { return disclaimer; }
    @JsonProperty("disclaimer")
    public void setDisclaimer(String value) { this.disclaimer = value; }
}

// Averages.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;

public class Averages {
    private long cycleLength;
    private long periodDuration;
    private long daysBetweenPeriods;

    @JsonProperty("cycle_length")
    public long getCycleLength() { return cycleLength; }
    @JsonProperty("cycle_length")
    public void setCycleLength(long value) { this.cycleLength = value; }

    @JsonProperty("period_duration")
    public long getPeriodDuration() { return periodDuration; }
    @JsonProperty("period_duration")
    public void setPeriodDuration(long value) { this.periodDuration = value; }

    @JsonProperty("days_between_periods")
    public long getDaysBetweenPeriods() { return daysBetweenPeriods; }
    @JsonProperty("days_between_periods")
    public void setDaysBetweenPeriods(long value) { this.daysBetweenPeriods = value; }
}

// CurrentStatus.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;

public class CurrentStatus {
    private String phase;
    private String description;
    private Object nextPeriod;
    private Object daysUntilNextPeriod;

    @JsonProperty("phase")
    public String getPhase() { return phase; }
    @JsonProperty("phase")
    public void setPhase(String value) { this.phase = value; }

    @JsonProperty("description")
    public String getDescription() { return description; }
    @JsonProperty("description")
    public void setDescription(String value) { this.description = value; }

    @JsonProperty("next_period")
    public Object getNextPeriod() { return nextPeriod; }
    @JsonProperty("next_period")
    public void setNextPeriod(Object value) { this.nextPeriod = value; }

    @JsonProperty("days_until_next_period")
    public Object getDaysUntilNextPeriod() { return daysUntilNextPeriod; }
    @JsonProperty("days_until_next_period")
    public void setDaysUntilNextPeriod(Object value) { this.daysUntilNextPeriod = value; }
}

// Cycle.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;

public class Cycle {
    private long cycleNumber;
    private FertileWindow period;
    private CycleOvulation ovulation;
    private FertileWindow fertileWindow;
    private PmsPhase pmsPhase;
    private CyclePhases cyclePhases;
    private String status;
    private Object daysUntil;
    private long daysAgo;

    @JsonProperty("cycle_number")
    public long getCycleNumber() { return cycleNumber; }
    @JsonProperty("cycle_number")
    public void setCycleNumber(long value) { this.cycleNumber = value; }

    @JsonProperty("period")
    public FertileWindow getPeriod() { return period; }
    @JsonProperty("period")
    public void setPeriod(FertileWindow value) { this.period = value; }

    @JsonProperty("ovulation")
    public CycleOvulation getOvulation() { return ovulation; }
    @JsonProperty("ovulation")
    public void setOvulation(CycleOvulation value) { this.ovulation = value; }

    @JsonProperty("fertile_window")
    public FertileWindow getFertileWindow() { return fertileWindow; }
    @JsonProperty("fertile_window")
    public void setFertileWindow(FertileWindow value) { this.fertileWindow = value; }

    @JsonProperty("pms_phase")
    public PmsPhase getPmsPhase() { return pmsPhase; }
    @JsonProperty("pms_phase")
    public void setPmsPhase(PmsPhase value) { this.pmsPhase = value; }

    @JsonProperty("cycle_phases")
    public CyclePhases getCyclePhases() { return cyclePhases; }
    @JsonProperty("cycle_phases")
    public void setCyclePhases(CyclePhases value) { this.cyclePhases = value; }

    @JsonProperty("status")
    public String getStatus() { return status; }
    @JsonProperty("status")
    public void setStatus(String value) { this.status = value; }

    @JsonProperty("days_until")
    public Object getDaysUntil() { return daysUntil; }
    @JsonProperty("days_until")
    public void setDaysUntil(Object value) { this.daysUntil = value; }

    @JsonProperty("days_ago")
    public long getDaysAgo() { return daysAgo; }
    @JsonProperty("days_ago")
    public void setDaysAgo(long value) { this.daysAgo = value; }
}

// CyclePhases.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;

public class CyclePhases {
    private Follicular menstrual;
    private Follicular follicular;
    private CyclePhasesOvulation ovulation;
    private Follicular luteal;

    @JsonProperty("menstrual")
    public Follicular getMenstrual() { return menstrual; }
    @JsonProperty("menstrual")
    public void setMenstrual(Follicular value) { this.menstrual = value; }

    @JsonProperty("follicular")
    public Follicular getFollicular() { return follicular; }
    @JsonProperty("follicular")
    public void setFollicular(Follicular value) { this.follicular = value; }

    @JsonProperty("ovulation")
    public CyclePhasesOvulation getOvulation() { return ovulation; }
    @JsonProperty("ovulation")
    public void setOvulation(CyclePhasesOvulation value) { this.ovulation = value; }

    @JsonProperty("luteal")
    public Follicular getLuteal() { return luteal; }
    @JsonProperty("luteal")
    public void setLuteal(Follicular value) { this.luteal = value; }
}

// Follicular.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class Follicular {
    private LocalDate start;
    private LocalDate end;
    private String description;

    @JsonProperty("start")
    public LocalDate getStart() { return start; }
    @JsonProperty("start")
    public void setStart(LocalDate value) { this.start = value; }

    @JsonProperty("end")
    public LocalDate getEnd() { return end; }
    @JsonProperty("end")
    public void setEnd(LocalDate value) { this.end = value; }

    @JsonProperty("description")
    public String getDescription() { return description; }
    @JsonProperty("description")
    public void setDescription(String value) { this.description = value; }
}

// CyclePhasesOvulation.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class CyclePhasesOvulation {
    private LocalDate date;
    private String description;

    @JsonProperty("date")
    public LocalDate getDate() { return date; }
    @JsonProperty("date")
    public void setDate(LocalDate value) { this.date = value; }

    @JsonProperty("description")
    public String getDescription() { return description; }
    @JsonProperty("description")
    public void setDescription(String value) { this.description = value; }
}

// FertileWindow.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class FertileWindow {
    private LocalDate startDate;
    private LocalDate endDate;
    private long durationDays;

    @JsonProperty("start_date")
    public LocalDate getStartDate() { return startDate; }
    @JsonProperty("start_date")
    public void setStartDate(LocalDate value) { this.startDate = value; }

    @JsonProperty("end_date")
    public LocalDate getEndDate() { return endDate; }
    @JsonProperty("end_date")
    public void setEndDate(LocalDate value) { this.endDate = value; }

    @JsonProperty("duration_days")
    public long getDurationDays() { return durationDays; }
    @JsonProperty("duration_days")
    public void setDurationDays(long value) { this.durationDays = value; }
}

// CycleOvulation.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class CycleOvulation {
    private LocalDate date;
    private long dayOfCycle;

    @JsonProperty("date")
    public LocalDate getDate() { return date; }
    @JsonProperty("date")
    public void setDate(LocalDate value) { this.date = value; }

    @JsonProperty("day_of_cycle")
    public long getDayOfCycle() { return dayOfCycle; }
    @JsonProperty("day_of_cycle")
    public void setDayOfCycle(long value) { this.dayOfCycle = value; }
}

// PmsPhase.java

package com.apiverve.menstrualcycle.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class PmsPhase {
    private LocalDate startDate;
    private LocalDate endDate;

    @JsonProperty("start_date")
    public LocalDate getStartDate() { return startDate; }
    @JsonProperty("start_date")
    public void setStartDate(LocalDate value) { this.startDate = value; }

    @JsonProperty("end_date")
    public LocalDate getEndDate() { return endDate; }
    @JsonProperty("end_date")
    public void setEndDate(LocalDate value) { this.endDate = value; }
}