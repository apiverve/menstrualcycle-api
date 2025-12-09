declare module '@apiverve/menstrualcycle' {
  export interface menstrualcycleOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface menstrualcycleResponse {
    status: string;
    error: string | null;
    data: MenstrualCycleCalculatorData;
    code?: number;
  }


  interface MenstrualCycleCalculatorData {
      lastPeriodDate:   Date;
      cycleLength:      number;
      periodLength:     number;
      cyclesCalculated: number;
      cycles:           Cycle[];
      currentStatus:    CurrentStatus;
      averages:         Averages;
      disclaimer:       string;
  }
  
  interface Averages {
      cycleLength:        number;
      periodDuration:     number;
      daysBetweenPeriods: number;
  }
  
  interface CurrentStatus {
      phase:               string;
      description:         string;
      nextPeriod:          null;
      daysUntilNextPeriod: null;
  }
  
  interface Cycle {
      cycleNumber:   number;
      period:        FertileWindow;
      ovulation:     CycleOvulation;
      fertileWindow: FertileWindow;
      pmsPhase:      PmsPhase;
      cyclePhases:   CyclePhases;
      status:        string;
      daysUntil:     null;
      daysAgo:       number;
  }
  
  interface CyclePhases {
      menstrual:  Follicular;
      follicular: Follicular;
      ovulation:  CyclePhasesOvulation;
      luteal:     Follicular;
  }
  
  interface Follicular {
      start:       Date;
      end:         Date;
      description: string;
  }
  
  interface CyclePhasesOvulation {
      date:        Date;
      description: string;
  }
  
  interface FertileWindow {
      startDate:    Date;
      endDate:      Date;
      durationDays: number;
  }
  
  interface CycleOvulation {
      date:       Date;
      dayOfCycle: number;
  }
  
  interface PmsPhase {
      startDate: Date;
      endDate:   Date;
  }

  export default class menstrualcycleWrapper {
    constructor(options: menstrualcycleOptions);

    execute(callback: (error: any, data: menstrualcycleResponse | null) => void): Promise<menstrualcycleResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: menstrualcycleResponse | null) => void): Promise<menstrualcycleResponse>;
    execute(query?: Record<string, any>): Promise<menstrualcycleResponse>;
  }
}
