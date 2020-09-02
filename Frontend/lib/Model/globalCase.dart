class GlobalCase {
  String total_cases;
  String new_cases;
  String total_deaths;
  String total_recovered;
  String active_cases;
  String serious_critical;
  String total_cases_per_1m_population;
  String deaths_per_1m_population;
  String statistic_taken_at;

  GlobalCase({
    this.total_cases,
    this.new_cases,
    this.total_deaths,
    this.total_recovered,
    this.active_cases,
    this.serious_critical,
    this.total_cases_per_1m_population,
    this.deaths_per_1m_population,
    this.statistic_taken_at,
  });

  GlobalCase.fromMap(Map<String, dynamic> map) {
    this.total_cases = map["total_cases"];
    this.new_cases = map["new_cases"];
    this.total_deaths = map["total_deaths"];
    this.total_recovered = map["total_recovered"];
    this.active_cases = map["active_cases"];
    this.serious_critical = map["serious_critical"];
    this.total_cases_per_1m_population = map["total_cases_per_1m_population"];
    this.deaths_per_1m_population = map["deaths_per_1m_population"];
    this.statistic_taken_at = map["statistic_taken_at"];
  }
}
