if @Incidents.find().count() is 0
  @Incidents.insert
    title: "Incident 01"
    lat: 14.113
    long: 13.25

  @Incidents.insert
    title: "Incident 02"
    lat: 12.111
    long: 14.55

  @Incidents.insert
    title: "Incident 03"
    lat: 10.99
    long: 11.1

  @Incidents.insert
    title: "Incidnet 04"
    lat: 10.77
    long: 9.884

  @Incidents.insert
    title: "Incidnet 04"
    lat: 18.77
    long: 23.884