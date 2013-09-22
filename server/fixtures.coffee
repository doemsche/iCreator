if @Incidents.find().count() is 0
  @Incidents.insert
    title: "Incident 01"
    userId: 1
    lat: 14.113
    long: 13.25
    description: "This was the incidnet n 01 and I am sad to report that it got busted right in front of this shop."

  @Incidents.insert
    title: "Incident 02"
    userId: 1
    lat: 12.111
    long: 14.55
    description: "This was the incidnet n 02 and I am sad to report that it got busted right in front of this shop."

  @Incidents.insert
    title: "Incident 03"
    userId: 1
    lat: 10.99
    long: 11.1
    description: "This was the incidnet n 03 and I am sad to report that it got busted right in front of this shop."

  @Incidents.insert
    title: "Incidnet 04"
    userId: 1
    lat: 10.77
    long: 9.884
    description: "This was the incidnet n 04 and I am sad to report that it got busted right in front of this shop."

  @Incidents.insert
    title: "Incidnet 05"
    userId: 1
    lat: 18.77
    long: 23.884
    description: "This was the incidnet n 05 and I am sad to report that it got busted right in front of this shop."