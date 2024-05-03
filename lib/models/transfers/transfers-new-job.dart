class TransferNewJob {
  final int idPeople;
  final int idNewJob;

  TransferNewJob({required this.idPeople, required this.idNewJob});

  Map<String, dynamic> toJson() => {
        'idPeople': idPeople,
        'idNewJob': idNewJob,
      };

TransferNewJob.fromJson(Map<String, dynamic> json):
idPeople = json['idPeople'],
idNewJob = json['idNewJob'];

static TransferNewJob goToJson(json) => TransferNewJob(
  idPeople: json['idPeople'],
  idNewJob: json['idNewJob']);
}
