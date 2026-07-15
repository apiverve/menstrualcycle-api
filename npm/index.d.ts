declare module '@apiverve/menstrualcycle' {
  export interface menstrualcycleOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface menstrualcycleResponse {
    status: string;
    error: string | null;
    data: MenstrualCycleCalculatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface MenstrualCycleCalculatorData {
      lastPeriodDate:   Date | null;
      cycleLength:      number | null;
      periodLength:     number | null;
      cyclesCalculated: number | null;
      cycles:           Cycle[];
      currentStatus:    CurrentStatus;
      averages:         Averages;
      disclaimer:       null | string;
  }
  
  interface Averages {
      cycleLength:        number | null;
      periodDuration:     number | null;
      daysBetweenPeriods: number | null;
  }
  
  interface CurrentStatus {
      phase:               null | string;
      description:         null | string;
      nextPeriod:          null;
      daysUntilNextPeriod: null;
  }
  
  interface Cycle {
      cycleNumber:   number | null;
      period:        FertileWindow;
      ovulation:     CycleOvulation;
      fertileWindow: FertileWindow;
      pmsPhase:      PmsPhase;
      cyclePhases:   CyclePhases;
      status:        null | string;
      daysUntil:     null;
      daysAgo:       number | null;
  }
  
  interface CyclePhases {
      menstrual:  Follicular;
      follicular: Follicular;
      ovulation:  CyclePhasesOvulation;
      luteal:     Follicular;
  }
  
  interface Follicular {
      start:       Date | null;
      end:         Date | null;
      description: null | string;
  }
  
  interface CyclePhasesOvulation {
      date:        Date | null;
      description: null | string;
  }
  
  interface FertileWindow {
      startDate:    Date | null;
      endDate:      Date | null;
      durationDays: number | null;
  }
  
  interface CycleOvulation {
      date:       Date | null;
      dayOfCycle: number | null;
  }
  
  interface PmsPhase {
      startDate: Date | null;
      endDate:   Date | null;
  }

  export default class menstrualcycleWrapper {
    constructor(options: menstrualcycleOptions);

    execute(callback: (error: any, data: menstrualcycleResponse | null) => void): Promise<menstrualcycleResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: menstrualcycleResponse | null) => void): Promise<menstrualcycleResponse>;
    execute(query?: Record<string, any>): Promise<menstrualcycleResponse>;
  }
}
