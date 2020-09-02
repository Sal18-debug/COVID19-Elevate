class CountryCase {
  String country_name;
  String cases;
  String deaths;
  String total_recovered;
  String active_cases;
  String serious_critical;
  String total_cases_per_1m_population;
  String deaths_per_1m_population;
  String total_tests;

  CountryCase({
    this.country_name,
    this.cases,
    this.deaths,
    this.total_recovered,
    this.active_cases,
    this.serious_critical,
    this.total_cases_per_1m_population,
    this.deaths_per_1m_population,
    this.total_tests,
  });

  CountryCase.fromMap(Map<String, dynamic> map) {
    this.country_name = map["country_name"];
    this.cases = map["cases"];
    this.deaths = map["deaths"];
    this.total_recovered = map["total_recovered"];
    this.active_cases = map["active_cases"];
    this.serious_critical = map["serious_critical"];
    this.total_cases_per_1m_population = map["total_cases_per_1m_population"];
    this.deaths_per_1m_population = map["deaths_per_1m_population"];
    this.total_tests = map["total_tests"];
  }
}
