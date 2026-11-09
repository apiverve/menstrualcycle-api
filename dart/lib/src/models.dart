/// Response models for the Menstrual Cycle Calculator API.

/// API Response wrapper.
class MenstrualcycleResponse {
  final String status;
  final dynamic error;
  final MenstrualcycleData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  MenstrualcycleResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory MenstrualcycleResponse.fromJson(Map<String, dynamic> json) => MenstrualcycleResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? MenstrualcycleData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Menstrual Cycle Calculator API.

class MenstrualcycleData {
  String? lastPeriodDate;
  num? cycleLength;
  num? periodLength;
  num? cyclesCalculated;
  List<MenstrualcycleDataCyclesItem>? cycles;
  MenstrualcycleDataCurrentStatus? currentStatus;
  MenstrualcycleDataAverages? averages;
  String? disclaimer;

  MenstrualcycleData({
    this.lastPeriodDate,
    this.cycleLength,
    this.periodLength,
    this.cyclesCalculated,
    this.cycles,
    this.currentStatus,
    this.averages,
    this.disclaimer,
  });

  factory MenstrualcycleData.fromJson(Map<String, dynamic> json) => MenstrualcycleData(
      lastPeriodDate: json['last_period_date'],
      cycleLength: json['cycle_length'],
      periodLength: json['period_length'],
      cyclesCalculated: json['cycles_calculated'],
      cycles: (json['cycles'] as List?)?.map((e) => MenstrualcycleDataCyclesItem.fromJson(e)).toList(),
      currentStatus: json['current_status'] != null ? MenstrualcycleDataCurrentStatus.fromJson(json['current_status']) : null,
      averages: json['averages'] != null ? MenstrualcycleDataAverages.fromJson(json['averages']) : null,
      disclaimer: json['disclaimer'],
    );
}

class MenstrualcycleDataCyclesItem {
  num? cycleNumber;
  MenstrualcycleDataCyclesItemPeriod? period;
  MenstrualcycleDataCyclesItemOvulation? ovulation;
  MenstrualcycleDataCyclesItemFertileWindow? fertileWindow;
  MenstrualcycleDataCyclesItemPmsPhase? pmsPhase;
  MenstrualcycleDataCyclesItemCyclePhases? cyclePhases;
  String? status;
  dynamic daysUntil;
  num? daysAgo;

  MenstrualcycleDataCyclesItem({
    this.cycleNumber,
    this.period,
    this.ovulation,
    this.fertileWindow,
    this.pmsPhase,
    this.cyclePhases,
    this.status,
    this.daysUntil,
    this.daysAgo,
  });

  factory MenstrualcycleDataCyclesItem.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItem(
      cycleNumber: json['cycle_number'],
      period: json['period'] != null ? MenstrualcycleDataCyclesItemPeriod.fromJson(json['period']) : null,
      ovulation: json['ovulation'] != null ? MenstrualcycleDataCyclesItemOvulation.fromJson(json['ovulation']) : null,
      fertileWindow: json['fertile_window'] != null ? MenstrualcycleDataCyclesItemFertileWindow.fromJson(json['fertile_window']) : null,
      pmsPhase: json['pms_phase'] != null ? MenstrualcycleDataCyclesItemPmsPhase.fromJson(json['pms_phase']) : null,
      cyclePhases: json['cycle_phases'] != null ? MenstrualcycleDataCyclesItemCyclePhases.fromJson(json['cycle_phases']) : null,
      status: json['status'],
      daysUntil: json['days_until'],
      daysAgo: json['days_ago'],
    );
}

class MenstrualcycleDataCyclesItemPeriod {
  String? startDate;
  String? endDate;
  num? durationDays;

  MenstrualcycleDataCyclesItemPeriod({
    this.startDate,
    this.endDate,
    this.durationDays,
  });

  factory MenstrualcycleDataCyclesItemPeriod.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemPeriod(
      startDate: json['start_date'],
      endDate: json['end_date'],
      durationDays: json['duration_days'],
    );
}

class MenstrualcycleDataCyclesItemOvulation {
  String? date;
  num? dayOfCycle;

  MenstrualcycleDataCyclesItemOvulation({
    this.date,
    this.dayOfCycle,
  });

  factory MenstrualcycleDataCyclesItemOvulation.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemOvulation(
      date: json['date'],
      dayOfCycle: json['day_of_cycle'],
    );
}

class MenstrualcycleDataCyclesItemFertileWindow {
  String? startDate;
  String? endDate;
  num? durationDays;

  MenstrualcycleDataCyclesItemFertileWindow({
    this.startDate,
    this.endDate,
    this.durationDays,
  });

  factory MenstrualcycleDataCyclesItemFertileWindow.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemFertileWindow(
      startDate: json['start_date'],
      endDate: json['end_date'],
      durationDays: json['duration_days'],
    );
}

class MenstrualcycleDataCyclesItemPmsPhase {
  String? startDate;
  String? endDate;

  MenstrualcycleDataCyclesItemPmsPhase({
    this.startDate,
    this.endDate,
  });

  factory MenstrualcycleDataCyclesItemPmsPhase.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemPmsPhase(
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
}

class MenstrualcycleDataCyclesItemCyclePhases {
  MenstrualcycleDataCyclesItemCyclePhasesMenstrual? menstrual;
  MenstrualcycleDataCyclesItemCyclePhasesFollicular? follicular;
  MenstrualcycleDataCyclesItemCyclePhasesOvulation? ovulation;
  MenstrualcycleDataCyclesItemCyclePhasesLuteal? luteal;

  MenstrualcycleDataCyclesItemCyclePhases({
    this.menstrual,
    this.follicular,
    this.ovulation,
    this.luteal,
  });

  factory MenstrualcycleDataCyclesItemCyclePhases.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemCyclePhases(
      menstrual: json['menstrual'] != null ? MenstrualcycleDataCyclesItemCyclePhasesMenstrual.fromJson(json['menstrual']) : null,
      follicular: json['follicular'] != null ? MenstrualcycleDataCyclesItemCyclePhasesFollicular.fromJson(json['follicular']) : null,
      ovulation: json['ovulation'] != null ? MenstrualcycleDataCyclesItemCyclePhasesOvulation.fromJson(json['ovulation']) : null,
      luteal: json['luteal'] != null ? MenstrualcycleDataCyclesItemCyclePhasesLuteal.fromJson(json['luteal']) : null,
    );
}

class MenstrualcycleDataCyclesItemCyclePhasesMenstrual {
  String? start;
  String? end;
  String? description;

  MenstrualcycleDataCyclesItemCyclePhasesMenstrual({
    this.start,
    this.end,
    this.description,
  });

  factory MenstrualcycleDataCyclesItemCyclePhasesMenstrual.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemCyclePhasesMenstrual(
      start: json['start'],
      end: json['end'],
      description: json['description'],
    );
}

class MenstrualcycleDataCyclesItemCyclePhasesFollicular {
  String? start;
  String? end;
  String? description;

  MenstrualcycleDataCyclesItemCyclePhasesFollicular({
    this.start,
    this.end,
    this.description,
  });

  factory MenstrualcycleDataCyclesItemCyclePhasesFollicular.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemCyclePhasesFollicular(
      start: json['start'],
      end: json['end'],
      description: json['description'],
    );
}

class MenstrualcycleDataCyclesItemCyclePhasesOvulation {
  String? date;
  String? description;

  MenstrualcycleDataCyclesItemCyclePhasesOvulation({
    this.date,
    this.description,
  });

  factory MenstrualcycleDataCyclesItemCyclePhasesOvulation.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemCyclePhasesOvulation(
      date: json['date'],
      description: json['description'],
    );
}

class MenstrualcycleDataCyclesItemCyclePhasesLuteal {
  String? start;
  String? end;
  String? description;

  MenstrualcycleDataCyclesItemCyclePhasesLuteal({
    this.start,
    this.end,
    this.description,
  });

  factory MenstrualcycleDataCyclesItemCyclePhasesLuteal.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCyclesItemCyclePhasesLuteal(
      start: json['start'],
      end: json['end'],
      description: json['description'],
    );
}

class MenstrualcycleDataCurrentStatus {
  String? phase;
  String? description;
  dynamic nextPeriod;
  dynamic daysUntilNextPeriod;

  MenstrualcycleDataCurrentStatus({
    this.phase,
    this.description,
    this.nextPeriod,
    this.daysUntilNextPeriod,
  });

  factory MenstrualcycleDataCurrentStatus.fromJson(Map<String, dynamic> json) => MenstrualcycleDataCurrentStatus(
      phase: json['phase'],
      description: json['description'],
      nextPeriod: json['next_period'],
      daysUntilNextPeriod: json['days_until_next_period'],
    );
}

class MenstrualcycleDataAverages {
  num? cycleLength;
  num? periodDuration;
  num? daysBetweenPeriods;

  MenstrualcycleDataAverages({
    this.cycleLength,
    this.periodDuration,
    this.daysBetweenPeriods,
  });

  factory MenstrualcycleDataAverages.fromJson(Map<String, dynamic> json) => MenstrualcycleDataAverages(
      cycleLength: json['cycle_length'],
      periodDuration: json['period_duration'],
      daysBetweenPeriods: json['days_between_periods'],
    );
}

class MenstrualcycleRequest {
  String lastPeriod;
  int? cycleLength;
  int? periodLength;
  int? cycles;

  MenstrualcycleRequest({
    required this.lastPeriod,
    this.cycleLength,
    this.periodLength,
    this.cycles,
  });

  Map<String, dynamic> toJson() => {
      'last_period': lastPeriod,
      if (cycleLength != null) 'cycle_length': cycleLength,
      if (periodLength != null) 'period_length': periodLength,
      if (cycles != null) 'cycles': cycles,
    };
}
